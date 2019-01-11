label_map = []
with open('../classes.txt') as f:
    with open('dist/label-map.pbtxt', 'w+') as out_file:
        lines = f.readlines()
        for idx, line in enumerate(lines):
            if idx == 0: continue
            out_file.write(
"""item {
    id: %d
    name: \"%s\"
}
""" % (idx, line.strip()))
            #label_map.append(
            #        """item {
            #            id: %d
            #            name: \"%s\"
            #        }
            #        """ % (idx, line))


print("Created label map dist/label-map.pbtxt")
