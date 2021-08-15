(
s = s ? Server.default;

s.waitForBoot {

	~dirt.free;
	~dirt = SuperDirt.new(2, s);
	~numberOfOrbits = 12;

	//~dirt.loadSoundFiles();

	~drumMachinesDir = PathName.new("C:\\Users\\Renzo\\Documents\\Tidal\\tidal-drum-machines\\machines");
	~machines = ~drumMachinesDir.folders; //All drum machines
	/*~machines = ['Linn9000','RolandTR909']; //Selected drum machines
	~machines.do { arg m,i; ~machines[i]=(~drumMachinesDir+/+m) }*/

	(
		~machines.do({
			arg machine;
			var folders = machine.folders;
			postln("LOADING DRUM MACHINE: "++machine.folderName);
			folders.do({
				arg folder;
				~dirt.loadSoundFiles(folder.fullPath,namingFunction: { |x| x.basename.replace("-","")});
			});
		});
	);

	s.sync;
	~dirt.start(57120, 0!~numberOfOrbits);
};
);