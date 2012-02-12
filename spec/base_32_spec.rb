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
    
    it 'decodes 0_32 to be 0_10' do
      Base32.decode('0').should == 0
    end
    
    it 'decodes 1_32 to be 1_10' do
      Base32.decode('1').should == 1
    end
    
    it 'decodes 2_32 to be 2_10' do
      Base32.decode('2').should == 2
    end
    
    it 'decodes 3_32 to be 3_10' do
      Base32.decode('3').should == 3
    end
    
    it 'decodes 9_32 to be 9_10' do
      Base32.decode('9').should == 9
    end
    
    it 'decodes a_32 to be 10_10' do
      Base32.decode('a').should == 10
    end
    
    it 'decodes B_32 to be 11_10' do
      Base32.decode('B').should == 11
    end
    
    it 'decodes c_32 to be 12_10' do
      Base32.decode('c').should == 12
    end
    
    it 'decodes Z_32 to be 31_10' do
      Base32.decode('Z').should == 31
    end
    
    it 'decodes 10_32 to be 32_10' do
      Base32.decode('10').should == 32
    end
    
    it 'decodes 11_32 to be 33_10' do
      Base32.decode('11').should == 33
    end
    
    it 'decodes il_32 to be 33_10' do
      Base32.decode('il').should == 33
    end
    
    it 'decodes 1234ABCD_32 to be 36612418957_10' do
      Base32.decode('1234ABCD').should == 36612418957
    end
    
    it 'decodes ZEND_32 to be 1030829_10' do
      Base32.decode('ZEND').should == 1030829
    end
    
    it 'decodes DaNIEl_32 to be 447382977_10' do
      Base32.decode('DaNIEl').should == 447382977
    end
    
  end
  
  context 'encode' do
    
    it 'encodes 0_10 to be 0_32' do
      Base32.encode(0).should == '0'
    end
    
    it 'encodes 1_10 to be 1_32' do
      Base32.encode(1).should == '1'
    end
    
    it 'encodes 2_10 to be 2_32' do
      Base32.encode(2).should == '2'
    end
    
    it 'encodes 3_10 to be 3_32' do
      Base32.encode(3).should == '3'
    end
    
    it 'encodes 9_10 to be 9_32' do
      Base32.encode(9).should == '9'
    end
    
    it 'encodes 10_10 to be a_32' do
      Base32.encode(10).should == 'A'
    end
    
    it 'encodes 11_10 to be B_32' do
      Base32.encode(11).should == 'B'
    end
    
    it 'encodes 12_10 to be c_32' do
      Base32.encode(12).should == 'C'
    end
    
    it 'encodes 31_10 to be Z_32' do
      Base32.encode(31).should == 'Z'
    end
    
    it 'encodes 32_10 to be 10_32' do
      Base32.encode(32).should == '10'
    end
    
    it 'encodes 33_10 to be 11_32' do
      Base32.encode(33).should == '11'
    end
        
    it 'encodes 36612418957_10 to be 1234ABCD_32' do
      Base32.encode(36612418957).should == '1234ABCD'
    end
    
    it 'encodes 1030829_10 to be ZEND_32' do
      Base32.encode(1030829).should == 'ZEND'
    end
    
    it 'encodes 447382977_10 to be DAN1E1_32' do
      Base32.encode(447382977).should == 'DAN1E1'
    end
    
  end
  
end