require '../lib/base32.rb'

describe Base32 do
  
  context 'normalize' do
    it 'returns a normalized version of a base-32 number' do
      Base32.normalize('123').should == '123'
      Base32.normalize('i23').should == '123'
      Base32.normalize('abc').should == 'ABC'
      Base32.normalize('oO0').should == '000'
      Base32.normalize('iIlL1').should == '11111'
      Base32.normalize('zend').should == 'ZEND'
      Base32.normalize('Daniel Is Sexy').should == 'DAN1E11SSEXY'
    end
  end
  
  context 'decode' do
    
    it 'decodes 0 to be 0' do
      Base32.decode('0').should == 0
    end
    
    it 'decodes 1 to be 1' do
      Base32.decode('1').should == 1
    end
    
    it 'decodes 2 to be 2' do
      Base32.decode('2').should == 2
    end
    
    it 'decodes 3 to be 3' do
      Base32.decode('3').should == 3
    end
    
    it 'decodes 9 to be 9' do
      Base32.decode('9').should == 9
    end
    
    it 'decodes a to be 10' do
      Base32.decode('a').should == 10
    end
    
    it 'decodes B to be 11' do
      Base32.decode('B').should == 11
    end
    
    it 'decodes c to be 12' do
      Base32.decode('c').should == 12
    end
    
    it 'decodes Z to be 31' do
      Base32.decode('Z').should == 31
    end
    
    it 'decodes 10 to be 32' do
      Base32.decode('10').should == 32
    end
    
    it 'decodes 11 to be 33' do
      Base32.decode('11').should == 33
    end
    
    it 'decodes il to be 33' do
      Base32.decode('il').should == 33
    end
    
    it 'decodes 1234ABCD to be 36612418957' do
      Base32.decode('1234ABCD').should == 36612418957
    end
    
    it 'decodes ZEND to be 1030829' do
      Base32.decode('ZEND').should == 1030829
    end
    
    it 'decodes DaNIEl to be 447382977' do
      Base32.decode('DaNIEl').should == 447382977
    end
    
    it 'decodes ZZZZZ to be 32^5-1' do
      Base32.decode('ZZZZZ').should == (32**5 - 1)
    end
    
    it 'decodes ZZZZZZZZZZZ to be 32^11-1' do
      Base32.decode('ZZZZZZZZZZZ').should == (32**11 - 1)
    end
    
  end
  
  context 'encode' do
    
    it 'encodes 0 to be 0' do
      Base32.encode(0).should == '0'
    end
    
    it 'encodes 1 to be 1' do
      Base32.encode(1).should == '1'
    end
    
    it 'encodes 2 to be 2' do
      Base32.encode(2).should == '2'
    end
    
    it 'encodes 3 to be 3' do
      Base32.encode(3).should == '3'
    end
    
    it 'encodes 9 to be 9' do
      Base32.encode(9).should == '9'
    end
    
    it 'encodes 10 to be a' do
      Base32.encode(10).should == 'A'
    end
    
    it 'encodes 11 to be B' do
      Base32.encode(11).should == 'B'
    end
    
    it 'encodes 12 to be c' do
      Base32.encode(12).should == 'C'
    end
    
    it 'encodes 31 to be Z' do
      Base32.encode(31).should == 'Z'
    end
    
    it 'encodes 32 to be 10' do
      Base32.encode(32).should == '10'
    end
    
    it 'encodes 33 to be 11' do
      Base32.encode(33).should == '11'
    end
        
    it 'encodes 36612418957 to be 1234ABCD' do
      Base32.encode(36612418957).should == '1234ABCD'
    end
    
    it 'encodes 1030829 to be ZEND' do
      Base32.encode(1030829).should == 'ZEND'
    end
    
    it 'encodes 447382977 to be DAN1E1' do
      Base32.encode(447382977).should == 'DAN1E1'
    end
    
    it 'encodes 32^5-1 to be ZZZZZ' do
      Base32.encode(32**5-1).should == 'ZZZZZ'
    end
    
    it 'encodes 32^11-1 to be ZZZZZZZZZZZ' do
      Base32.encode(32**11 - 1).should == 'ZZZZZZZZZZZ'
    end
    
  end
  
end