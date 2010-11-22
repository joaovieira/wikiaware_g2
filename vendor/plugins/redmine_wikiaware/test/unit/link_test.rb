require File.dirname(__FILE__) + '/../test_helper'

class LinkTest < ActiveSupport::TestCase
  fixtures :links

  # Replace this with your real tests.
  def test_parsse0
  
  
	arrayLinks = Array.new
	
	arryLiksParse = Array.new
	arrayLinks.push("dest1")
	
  
    arryLiksParse= (LinksController.new).parseLinks("[[dest1]]")
    assert arryLiksParse == arrayLinks
  end
  
  
  def test_parsse1
  
  
	arrayLinks = Array.new
	
	arryLiksParse = Array.new
	arrayLinks.push("dest1")
	
  
    arryLiksParse= (LinksController.new).parseLinks("[[dest1|lixo1]]")
    assert arryLiksParse == arrayLinks
  end

  def test_parsse2
  
  
	arrayLinks = Array.new
	
	arryLiksParse = Array.new
	arrayLinks.push("dest1")
	
  
    arryLiksParse= (LinksController.new).parseLinks("asdasdas[[dest1|lixo1]]asdasd[")
    assert arryLiksParse == arrayLinks
  end
  
  
   def test_parsse3
  
  
	arrayLinks = Array.new
	
	arryLiksParse = Array.new
	arrayLinks.push("dest1")
	arrayLinks.push("dest2")
	arrayLinks.push("dest3")
	
  
    arryLiksParse= (LinksController.new).parseLinks("asdas12das[[dest1|lixo1]]as21da[[dest2|lixo1]] sd1 asda[[dest3|lixo1]]assa")
    assert arryLiksParse == arrayLinks
  end
end