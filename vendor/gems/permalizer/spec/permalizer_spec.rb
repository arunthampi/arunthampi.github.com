require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + "/../lib/permalizer.rb"

describe Permalink::Permalizer, 'testing simple string conversions' do
  it "should create a simple permalink" do
    "testing one two three".permalize.should eql("testing-one-two-three")
    "Give me some dashes-in-here to dasherize".permalize.should eql("give-me-some-dashes-in-here-to-dasherize")
    "Show me a 1 2 3".permalize.should eql("show-me-a-1-2-3")
  end
  
  it "should return a valid permalink with apostrophes" do
    "test's".permalize.should eql("tests")
    "I've been here today".permalize.should eql("ive-been-here-today")
  end
  
  it "should correctly handle single and double quotes" do
    "\'here are some single quotes\'".permalize.should eql("here-are-some-single-quotes")
    "\"and double quotes\"".permalize.should eql("and-double-quotes")
  end
  
  it "should return lower case characters" do
    "Should HanDle UPPER case LeTtErS".permalize.should eql("should-handle-upper-case-letters")
  end
end

describe Permalink::Permalizer, "testing special characters" do
  it "should correctly handle special characters" do
    "testing_underscores".permalize.should eql("testing-underscores")
    "more _ underscores".permalize.should eql("more-underscores")
    "unicode chåråcter".permalize.should eql("unicode-character")
    "colon: and : ; semicolon".permalize.should eql("colon-and-semicolon")
    "ampersand & here".permalize.should eql("ampersand-here")
    "explanation point!".permalize.should eql("explanation-point")
    "how are you?".permalize.should eql("how-are-you")
  end
  
  it "should handle various types of characters" do
    "several characters *& all ' together and () such".permalize.should eql("several-characters-all-together-and-such")
  end
  
  it "should keep dashes intact and handle multiple dashes" do
    "keep-this dash".permalize.should eql("keep-this-dash")
    "remove -- multiple---dashes ---".permalize.should eql("remove-multiple-dashes")
  end
  
  it "should correctly handle hyphens" do
    "here is a–hyphen check–this out".permalize.should eql("here-is-a-hyphen-check-this-out")
  end
end

describe Permalink::Permalizer, 'testing various translation methods' do
  it "should perform permalization even with a misspelled tranlate_to" do
    Permalink::Permalizer.translate_to = :undefined_translation_method
    "This will be permalized".permalize.should eql("this-will-be-permalized")
  end
  
  it "should perform an utf-8 transformation" do
    Permalink::Permalizer.translate_to = :utf_8
    "This string contains utf-8 characters: esdrújula. €100".permalize.should eql("this-string-contains-utf-8-characters-esdrujula-eur100")
  end
end

describe Permalink::Permalizer, 'testing string decomposing' do
  Permalink::Permalizer.decompose_string = true
  "españa".permalize.should  == "espana" 
end

describe Permalink::Permalizer, 'testing the destructive permalize! method' do
  it "should pummel a string to destruction" do
    title = "12 monkeys gone crazy"
    title.permalize!
    title.should eql("12-monkeys-gone-crazy")
  end
end