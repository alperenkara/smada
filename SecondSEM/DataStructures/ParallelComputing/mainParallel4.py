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


###########################################################
#
#  Function which multiplies arrays
#
###########################################################

def multiplyArrays(NpArrays, indexFrom, indexTo, output, placeInQueue):
    if isinstance(indexFrom, int) and isinstance(indexTo, int):
        if indexTo>indexFrom:
            #print(NpArrays[indexFrom])
            #print("++++++++++")
            #print(NpArrays[indexFrom+1])
            #print("++++++++++")
            result = np.mat(NpArrays[indexFrom]) * np.mat(NpArrays[indexFrom + 1])
            for i in range(indexFrom+2, indexTo+1):
                #print("INDEX VALUE----->", i)
                #print(result)
                #print("---------------------")
                #print(NpArrays[i])
                result = np.mat(result) * np.mat(NpArrays[i])
                #print(threading.get_ident(), "current result", result)
                #print("==============================================")
            output.put(result)



#########################################################
#
#   Main function
#
#########################################################

if __name__ == '__main__':
    #################################################
    #
    # Creation of numpy arrays
    #
    #################################################

    Arrays = []
    NpArrays = []
    F = []
    n = 0
    try:
        fp = open("C:/Users//alper//Documents//GitHub//smada//SecondSEM//DataStructures//ParallelComputing//matrices-2.txt","r")
        line = fp.readline()
        dimensions = []
        rzad = []
        tablica = []
        while line:
            if line.find("-------------------------") != -1:
                1==1
            elif line.find("Matrix") != -1:
                #print(line)
                test = re.search('Matrix # (.+?)\[(.+?) x (.+?)]', line)
                #print(test)
                if test:
                    if len(tablica) > 0:
                        Arrays.append(tablica)
                    temp = [test.group(1), test.group(2), test.group(3)]
                    dimensions.append(temp)
                    temp = []
            else:
                data = line.split(' ')
                for i in data:
                    if i=="":
                        data.remove(i)
                for i in data:
                    if i.find("[[") != -1:
                        tablica = []
                        rzad = []
                        i = re.sub("\[\[", " ", i)
                    elif i.find("[") != -1:
                        if len(rzad) > 0:
                            tablica.append(rzad)
                        rzad = []
                        i = re.sub('\[', " ", i)
                    elif i.find("]]") != -1:
                        i = re.sub(']]', " ", i)
                        i = float(i)
                        rzad.append(i)
                        if len(rzad) > 0:
                            tablica.append(rzad)
                        rzad = []
                    if i != "" and isinstance(i, str):
                        i = re.sub('\[\[', " ", i)
                        i = re.sub('\[', " ", i)
                        i = re.sub(']', " ", i)
                        i = re.sub(']]', " ", i)
                        i = re.sub('\n', " ", i)
                    i = float(i)
                    rzad.append(i)
            try:
                line = fp.readline()
            except:
                break
    except:
        print("Something went wrong")
    finally:
        Arrays.append(tablica)
        fp.close()
        #print(dimensions)
        print("expected dimensions of the result: ", dimensions[0][1], " x ", dimensions[len(dimensions)-1][2])
        #print("liczba tablic --->", len(dimensions))
        if len(Arrays) != len(dimensions):
            print("Error, information about matrix dimentions has different no of matrices than the list which keeps matrices")
        for k in range(0,len(Arrays)):
            arrayDimensions = dimensions[k]
            dimension1 = arrayDimensions[1]
            dimension2 = arrayDimensions[2]
            #print(dimension1, dimension2)
            NpArrays.append(np.array(Arrays[k]))
            #print(np.array(Arrays[k]))
            #print("----------------------")


    #################################################
    #
    #  Multithreading multiplication of matrices
    #
    #################################################

    ################################################
    #  without threads
    ################################################
    """
    print("-----------------------------------------------------")
    print("solution1")
    print("linear multiplication")
    start_time = time.time()
    """
    numberOfMatrices = len(NpArrays)
    """
    result = np.matrix(NpArrays[0]) * np.matrix(NpArrays[1])
    for x in range(2, len(NpArrays)):
        result = np.matrix(result) * np.matrix(NpArrays[x])
    print(result)
    time1 = time.time() - start_time
    print("--- %s seconds ---" % (time.time() - start_time))
    """
    
    # with threads
    

    print("-----------------------------------------------------")
    print("solution2")
    print("multi-thread multiplication")
    output = mp.Queue()
    numberOfThreads = multiprocessing.cpu_count()
    zakres = int(numberOfMatrices/numberOfThreads)
    
    limity = list(range(0, numberOfMatrices, 1))

    if limity[-1] < numberOfMatrices-1:
        limity.append(numberOfMatrices)
   

    
    processes = []
    start_time = time.time()
    for i in range(0,numberOfThreads):
        if i != numberOfThreads:

            p = Process(target = multiplyArrays, args=(NpArrays, limity[i], limity[i+1]-1, output, i))
        else:
 
            p = Process(target = multiplyArrays, args = (NpArrays, limity[i], limity[i+1], output, i))
        p.start()
        processes.append(p)
    start_time = time.time()
    for p in processes:
        p.join()
    effects = [output.get() for p in processes]

    multiplyArrays(effects, 0, len(effects)-1, output, numberOfThreads+1)
    matrix = output.get(-1)
    print(matrix)
    time2 = time.time() - start_time
    print("--- %s seconds ---" % (time.time() - start_time))
    print("empirical dimensions:  ", matrix.shape)

    print("-----------------------------------------------------")
    print("time difference calculated as time1/time2", time1/time2)