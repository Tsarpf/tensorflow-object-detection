import random

SPLIT_RATIO = 80

with open('dist/labels.csv') as f:
    lines = f.readlines()

    train = open('dist/train.csv', 'w+')
    test = open('dist/test.csv', 'w+')

    train.write("filename,width,height,class,xmin,ymin,xmax,ymax\n")
    test.write("filename,width,height,class,xmin,ymin,xmax,ymax\n")



    # This would be so much cleaner if you could peek iterators in python :((
    line_iter = iter(lines)
    next(line_iter) # skip first line that defines the csv
    last_was_train = False
    last_filename = ''
    for line in line_iter:
        current_filename = line.split(',')[0]
        if current_filename == last_filename:
            if last_was_train: train.write(line)
            else: test.write(line)
            continue

        if random.randint(1, 100) < SPLIT_RATIO:
            last_was_train = True
            train.write(line)
        else:
            last_was_train = False
            test.write(line)

        last_filename = line.split(',')[0]

print("done")
