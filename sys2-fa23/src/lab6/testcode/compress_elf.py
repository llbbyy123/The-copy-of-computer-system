import struct
class Compress_elf:
    def __init__(self,filename,hexfilename,binfilename):
        self.filename=filename
        self.hexfilename=hexfilename
        self.binfilename=binfilename
        file=open(filename,"rt")
        self.textlines=file.readlines()
        for i in range(len(self.textlines)):
            self.textlines[i]=self.textlines[i].strip()
        file.close()
    
    def is_base(self,textline):
        return textline[0]=="@"

    def hex2base(self,textline):
        return 8*int(textline[1:],16)

    def compress(self):
        self.segment=0
        self.writecode=[]
        self.index=0
        while self.index<len(self.textlines):
            self.get_segment()
        self.writecode.insert(0,self.segment)
        if(len(self.writecode)%2!=0):
            self.writecode.append(0)
        
        file=open(self.hexfilename,"wt")
        file.write("@00000000\n")
        for code in self.writecode:
            textline="%016X"%code+'\n'
            file.write(textline)
        file.close()

        file=open(self.binfilename,"wb")
        for writecode in self.writecode:
            file.write(struct.pack('Q',writecode))
        file.close()

    def get_segment(self):
        self.segment+=1
        base=self.hex2base(self.textlines[self.index])
        binary=[]
        self.index+=1
        while(self.index<len(self.textlines) and not self.is_base(self.textlines[self.index])):
            textline=self.textlines[self.index]
            self.index+=1
            text=textline.split()
            data=int(text[0],16)
            binary.append(data)
            # binary.append(data//0x100000000)
            if(len(text)==2):
                data=int(text[1],16)
                binary.append(data)
                # binary.append(data//0x100000000)
        length=len(binary)
        self.writecode.append(base)
        self.writecode.append(length)
        self.writecode.extend(binary)

compress=Compress_elf("mini_sbi.hex","elf.hex","elf.bin")
compress.compress()