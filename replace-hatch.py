import glob

filenames = glob.glob('data/pokemon/base_stats/*.asm')

for filename in filenames:

	print('Update', filename)

	with open(filename, 'r', encoding='utf8') as file:
		lines = file.readlines()

	with open(filename, 'w', encoding='utf8') as file:
		for line in lines:
			if '; step cycles to hatch\n' in line:
				continue
			if line == '\tdb 5 ; unknown 2\n':
				file.write('\tdb 1 ; step cycles to hatch\n')
			file.write(line)


print('Done!')

## 5 10 15 20 25 30 35 40 80 120 possible values for step cycle number