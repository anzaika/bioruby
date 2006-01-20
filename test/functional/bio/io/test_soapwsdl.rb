#
# test/functional/bio/io/test_soapwsdl.rb - Unit test for SOAP/WSDL
#
#   Copyright (C) 2005 Mitsuteru Nakao <n@bioruby.org>
#
#  This library is free software; you can redistribute it and/or
#  modify it under the terms of the GNU Lesser General Public
#  License as published by the Free Software Foundation; either
#  version 2 of the License, or (at your option) any later version.
#
#  This library is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#  Lesser General Public License for more details.
#
#  You should have received a copy of the GNU Lesser General Public
#  License along with this library; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA
#
#  $Id: test_soapwsdl.rb,v 1.2 2006/01/20 12:04:03 k Exp $ 
#

require 'pathname'
libpath = Pathname.new(File.join(File.dirname(__FILE__), ['..'] * 4, 'lib')).cleanpath.to_s
$:.unshift(libpath) unless $:.include?(libpath)


require 'test/unit'
require 'bio/io/soapwsdl'

module Bio

class FuncTestSOAPWSDL < Test::Unit::TestCase

  def setup
    @wsdl = 'http://www.ebi.ac.uk/xembl/XEMBL.wsdl'
    @obj = Bio::SOAPWSDL.new(@wsdl)
  end

  def test_wsdl
    assert_equal(@wsdl, @obj.wsdl)
  end
  
  def test_set_wsdl
    @obj.wsdl = 'http://soap.genome.jp/KEGG.wsdl'
    assert_equal('http://soap.genome.jp/KEGG.wsdl', @obj.wsdl)
  end

  def test_log
    assert_equal(nil, @obj.log)
  end

  def test_set_log
    require 'stringio'
    io = StringIO.new
    @obj.log = io

    assert_equal(StringIO, @obj.log.class)
  end

end

end

