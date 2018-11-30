import re
import threading
import numpy as np
#import pp
import multiprocessing
from multiprocessing import Pool
from multiprocessing import Process
import os
from multiprocessing import Queue
from multiprocessing.pool import ThreadPool
from threading import Thread
import multiprocessing as mp
import random
import string
import time


# array multiplication
def multiplyArrays(NpArrays, indexFrom, indexTo, output, placeInQueue):
    if isinstance(indexFrom, int) and isinstance(indexTo, int):
        if indexTo > indexFrom:

            result = np.mat(NpArrays[indexFrom]) * \
                np.mat(NpArrays[indexFrom + 1])
            for i in range(indexFrom+2, indexTo+1):

                result = np.mat(result) * np.mat(NpArrays[i])

            output.put(result)


if __name__ == '__main__':

    # numpy arrays

    Arrays = []
    NpArrays = []
    F = []
    n = 0
    try:
        path = "C:/Users//alper//Documents//GitHub//smada//SecondSEM//DataStructures//ParallelComputing//matrices-2.txt"
        fp = open(path, "r")
        line = fp.readline()
        dimensions = []
        row = []
        tab = []
        while line:
            if line.find("-------------------------") != -1:
                1 == 1
            elif line.find("Matrix") != -1:

                test = re.search('Matrix # (.+?)\[(.+?) x (.+?)]', line)

                if test:
                    if len(tab) > 0:
                        Arrays.append(tab)
                    temp = [test.group(1), test.group(2), test.group(3)]
                    dimensions.append(temp)
                    temp = []
            else:
                data = line.split(' ')
                for i in data:
                    if i == "":
                        data.remove(i)
                for i in data:
                    if i.find("[[") != -1:
                        tab = []
                        row = []
                        i = re.sub("\[\[", " ", i)
                    elif i.find("[") != -1:
                        if len(row) > 0:
                            tab.append(row)
                        row = []
                        i = re.sub('\[', " ", i)
                    elif i.find("]]") != -1:
                        i = re.sub(']]', " ", i)
                        i = float(i)
                        row.append(i)
                        if len(row) > 0:
                            tab.append(row)
                        row = []
                    if i != "" and isinstance(i, str):
                        i = re.sub('\[\[', " ", i)
                        i = re.sub('\[', " ", i)
                        i = re.sub(']', " ", i)
                        i = re.sub(']]', " ", i)
                        i = re.sub('\n', " ", i)
                    i = float(i)
                    row.append(i)
            try:
                line = fp.readline()
            except:
                break
    except:
        print("wrong input")
    finally:
        Arrays.append(tab)
        fp.close()

        print("Result: ", dimensions[0][1], " x ",
              dimensions[len(dimensions)-1][2])

        if len(Arrays) != len(dimensions):
            print("Error2")
        for k in range(0, len(Arrays)):
            arrayDimensions = dimensions[k]
            dimension1 = arrayDimensions[1]
            dimension2 = arrayDimensions[2]

            NpArrays.append(np.array(Arrays[k]))

    
    

    numberOfMatrices = len(NpArrays)


#  with threads
    
    print("Our main multithreads solution")
    print("Multi Thread multiplication")
    output = mp.Queue()
    numberOfThreads = multiprocessing.cpu_count()
    dividedM = int(numberOfMatrices/numberOfThreads)
    
    limity = list(range(0, numberOfMatrices, dividedM))
    
    if limity[-1] < numberOfMatrices-1:
        limity.append(numberOfMatrices)
    
    
    processes = []
    # we start the measure time from this point

    start_time = time.time()

    for i in range(0, numberOfThreads):
        if i != numberOfThreads:
            p = Process(target=multiplyArrays, args=(
                NpArrays, limity[i], limity[i+1]-1, output, i))
        else:
            p = Process(target=multiplyArrays, args=(
                NpArrays, limity[i], limity[i+1], output, i))
        p.start()
        processes.append(p)
    #start_time = time.time()
    for p in processes:
        p.join()
    effects = [output.get() for p in processes]

    multiplyArrays(effects, 0, len(effects)-1, output, numberOfThreads+1)

    matrix = output.get(-1)

    print(matrix)

    #time2 = time.time() - start_time

    print("it takes {} seconds ".format(time.time() - start_time))
    

    
    
