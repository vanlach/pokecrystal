import glob

filenames = glob.glob('data/pokemon/base_stats/*.asm')

for filename in filenames:
	
	print('Update', filename)

	with open(filename, 'r', encoding='utf8') as file:
		lines = file.readlines()

	with open(filename, 'w', encoding='utf8') as file:
		for line in lines:
			if line == '\tdb {} ; step cycles to hatch\n':
				continue
			file.write('\tdb 10 ; step cycles to hatch\n')

print('Done!')