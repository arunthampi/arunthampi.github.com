---
layout: post
title: An explanation of the CouchDB views
section: writing
section_link: '/archives.html'
---

## {{ page.title }}

31 Aug 2009 - Singapore

Just wanted to pen this down so that I don't forget the logic behind the map-reduce function used to generate the content for [i.canhazthread.com](http://i.canhazthread.com) homepage.

## Requirements

i.canhazthread.com stores threads and replies as separate documents, with threads having the field _type_ set to *thread* and replies having the field _type_ set to *reply*. My requirement was to have the homepage display all threads in the database with the following attributes:

* Text of the thread
* Name of the author of the thread
* Timestamp of the thread
* Timestamp of the last reply of the thread
* Threads must be sorted by recency (most recent thread first)
* Number of replies associated with the thread

This seems quite trivial, but my biggest requirement was that this must be possible using _one_ HTTP call and not n + 1 (where n is the number of threads => 1 call to get all threads, and n calls to get details of replies for each thread).

## The Map Function

The map function is relatively straightforward as given below:

<script src="http://gist.github.com/178696.js">  </script>

This uses the [view collation technique](http://www.cmlenz.net/archives/2007/10/couchdb-joins) as described by Christopher Lenz and it basically emits k-v pairs where the keys represent the ID's of the threads and the values can be either threads or replies; but replies will always be preceded by the thread that it belongs to. Something like this:

* Thread 1 *T1* (id = *IDT1*, key = *IDT1* )
   -> Reply 1 to Thread 1 *RT1* (id = *IDR1*, key = *IDT1*)
   -> Reply 2 to Thread 1 *RT2* (id = *IDR2*, key = *IDT1*)
   -> Reply 3 to Thread 1 *RT3* (id = *IDR3*, key = *IDT1*)
* Thread 2 *T2* (id = *IDT2*, key = *IDT2*)
* Thread 3 *T3* (id = *IDT3*, key = *IDT3*)
   -> Reply 1 to Thread 3 *RT4* (id = *IDR4*, key = *IDT3*)
   -> Reply 2 to Thread 3 *RT5* (id = *IDR5*, key = *IDT3*)
* Thread 4 *T4* (id = *IDT4*, key = *IDT4*)


## The Reduce Function

The reduce function is where all the magic happens. (Not pasting the entire source here, please check it out [here](http://github.com/arunthampi/icanhazthread/blob/98575f2d370aa9676da7c6022bce7ee0754952ee/views/threads_with_num_replies/reduce.js))

### Associativity and Commutativity

One very important thing we have to keep in mind while implementing reduce functions (and which burned me a few times) is that views have to be associative and commutative, i.e. we should not assume that the reduce function will be called in a given order.

### Group Level

One other important feature of reduce functions (as detailed [here](http://wiki.apache.org/couchdb/Introduction_to_CouchDB_views)) which allowed me to do this is the group_level parameter. This lets you run the reduce function for sets of unique keys. In i.canhazthread.com's case, for example, when group_level is set to 1, the reduce function will be run four times - for Thread 1 ands its 3 associated replies; Thread 2 and its zero replies; Thread 3 and its 2 associated replies and finally Thread 4 - since each group has the same key (i.e. the ID of the thread). Thus when group_level=1, the final output of the reduce function will be like so:

<script src="http://gist.github.com/178706.js">  </script>

### Rereduce

The other captcha we have to keep in mind is the _rereduce_ property of CouchDB reduce functions. Rereduce is a step which happens with CouchDB when the reduce function is called not with the emitted k-v pairs from the map function, but with intermediate computed values from a previous call of the reduce function itself. Confused? Let me try again.

In the example for the first group (i.e. Thread 1 and its 3 associated replies) the reduce function can be called in many possible ways, two of which are detailed below:

The simplest scenario is when all four values are passed to the reduce function at once. In this case, re-reduce is not called and we get the final output with a single call of the reduce function.

The extreme case when the reduce function is called separately for each object: i.e. Reduce is called first for Thread 1; a second time for Reply 1; a third time for Reply 2 and finally a fourth time for Reply 3. Each call of the reduce function emits an intermediate value which will be sent again to the reduce function with the _rereduce_ parameter set to true. The reduce function must be able to handle this scenario.

The two scenarios are listed below:

#### Scenario 1

Reduce function is called *once*, like this:

reduce([ [IDT1, IDT1], [IDT1, IDR1], [IDT1, IDR2], [IDT1, IDR3] ], [T1, RT1, RT2, RT3], false);
  -> This emits the final value of the reduce function without any intermediate steps.

#### Scenario 2

Reduce function is called *multiple times*, like this:


reduce([IDT1, IDT1], [T1], false)
  -> Emits Intermediate Value O1 (called with rereduce = false)
reduce([IDT1, IDR1], [RT1], false)
  -> Emits Intermediate Value O2 (called with rereduce = false)
reduce([IDT1, IDR2], [RT2], false)
  -> Emits Intermediate Value O3 (called with rereduce = false)
reduce([IDT1, IDR3], [RT3], false)
  -> Emits Intermediate Value O4 (called with rereduce = false)

and finally

reduce(null, [O1, O2, O3, O4], true)
  -> Emits final value (called with rereduce = true)


### Sorting

The final conundrum was sorting - since CouchDB does not allow sorting based on values (although there are [ongoing efforts](http://n2.nabble.com/chaining-map-reduce-in-hovercraft-td3028752.html">ongoing efforts) to alleviate that problem) - we need to be innovative (read hackish). It's for this reason that the ID's of documents are a combination of the timestamp of the creation of the thread + the username of the creator (the username is added for uniqueness). With this it becomes very trivial to sort, since the key (or ID of the document) is a timestamp.


### Profit

So in summary, the reduce function takes as input all threads and its associated replies and emits a _result_ object per thread which gives the text associated with the thread, the thread creator's name, time of creation of thread, time of last reply and number of replies.


Hopefully I've managed been able to translate Javascript map/reduce to English. If not, you can follow along at the [GitHub repo](http://github.com/arunthampi/icanhazthread) and the [CouchDB wiki](http://wiki.couchdb.org) is an excellent resource as well.

The challenging task now is to go beyond simple sort-by-recency and use a popularity score (based on number of replies, age of thread, age of last reply, etc.) and use that popularity score to sort threads.

That is for another day.
