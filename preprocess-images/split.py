import random

SPLIT_RATIO = 80

with open('dist/labels.csv') as f:
    lines = f.readlines()

    train = open('dist/train.csv', 'w+')
    test = open('dist/test.csv', 'w+')

    train.write("filename,width,height,class,xmin,ymin,xmax,ymax\n")
    test.write("filename,width,height,class,xmin,ymin,xmax,ymax\n")

    #train.write('\n')
    #test.write('iine)

    for idx, line in enumerate(lines):
        if idx == 0:
            continue
        if random.randint(1, 100) < SPLIT_RATIO:
            train.write(line)
        else:
            test.write(line)

    print("done")
