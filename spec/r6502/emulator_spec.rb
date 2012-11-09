require 'spec_helper'

module R6502
  describe Emulator do
    it "Has registers" do
      @emu = Emulator.new
      @emu.pc = 0xfffe
      @emu.pc.should == 0xfffe
      @emu.s = 0xff
      @emu.s.should == 0xff
      @emu.p = 0xaa
      @emu.p.should == 0xaa
      @emu.a = 0xbb
      @emu.a.should == 0xbb
      @emu.x = 0xcc
      @emu.x.should == 0xcc
      @emu.y = 0xdd
      @emu.y.should == 0xdd
    end
    it "Has memory" do
      @emu = Emulator.new
      @emu.mem.set(0xfffe, 0x00)
      @emu.mem.set(0xffff, 0x01)
      @emu.mem.get(0xfffe).should == 0x00
      @emu.mem.get(0xffff).should == 0x01
    end
    it "Has cpu" do
      @emu = Emulator.new
      @emu.cpu.and(0x06, 0x03).should == 0x02
    end
    # moved to Cpu
    #it "Finds instruction and mode from opcode" do
    #  @emu = Emulator.new
    #  @emu.instr_mode(0xa9).should == {:instr => :lda, :mode => :imm}
    #  @emu.instr_mode(0x69).should == {:instr => :adc, :mode => :imm}
    #  @emu.instr_mode(0x65).should == {:instr => :adc, :mode => :zp}
    #  @emu.instr_mode(0x75).should == {:instr => :adc, :mode => :zpx}
    #end
    # moved to Cpu
    #it "Finds the argument to the instruction" do
    #  @emu = Emulator.new
    #  # IMPLIED
    #  @emu.arg(:imp, 0x66, 0x66).should == nil
    #  # IMMEDIATE
    #  @emu.arg(:imm, 0x40, 0x66).should == 0x40
    #  # ZERO PAGE
    #  @emu.arg(:zp, 0x50, 0x66).should == 0x50
    #    # ZPX
    #  @emu.x = 0xc0
    #  @emu.arg(:zpx, 0x0f, 0x66).should == 0xcf
    #    # ZPY
    #  @emu.y = 0xb0
    #  @emu.arg(:zpy, 0x0f, 0x66).should == 0xbf
    #  # RELATIVE
    #  @emu.pc = 0x100      #normally, pc inc'd during exectn and result
    #  @emu.arg(:rel, 0x80, 0x66).should == 0x180  #would be 0x182
    #  # ABSOLUTE
    #  @emu.arg(:abs, 0xff, 0x66).should == 0x66ff
    #    # ABSX
    #  @emu.x = 0x10
    #  @emu.arg(:absx, 0xef, 0x66).should == 0x66ff
    #    # ABSY
    #  @emu.y = 0x20
    #  @emu.arg(:absy, 0xdf, 0x66).should == 0x66ff
    #  # INDIRECT
    #  @emu.mem.set(0x1000, 0x30)
    #  @emu.mem.set(0x1001, 0x40)
    #  @emu.arg(:ind, 0x00, 0x10).should == 0x4030
    #    # INDX
    #  @emu.x = 0x03
    #  @emu.mem.set( 0xd0, 0xf0 )
    #  @emu.mem.set( 0xd1, 0xd0 )
    #  @emu.mem.set( 0xd0f0, 0x34 )
    #  @emu.arg(:indx, 0xcd, 0x66).should == 0x34
    #    # INDY
    #  @emu.y = 0x04
    #  @emu.mem.set( 0x10, 0xa0 )
    #  @emu.mem.set( 0x11, 0xb0 )
    #  @emu.mem.set( 0xb0a4, 0xcd )
    #  @emu.arg(:indy, 0x10, 0x66).should == 0xcd
    #end
  end
end
