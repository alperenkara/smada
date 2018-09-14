import cv2
import numpy as np
import csv
from matplotlib import cm
from matplotlib import pyplot as plt
import noise
import scipy

def load_data(rootpath="C:/Users/PLALKAR1/Documents/GTSRB_Final_Training_Images/GTSRB/Final_Training/Images",
              feature=None, cut_roi=True,
              test_split=0.2, seed=113
              ):
    
    classes = np.arange(0, 42, 2)
    
    X = []  
    labels = []  
    for c in range(len(classes)):
        
        prefix = rootpath + '/' + format(classes[c], '05d') + '/'

        gt_file = open(prefix + 'GT-' + format(classes[c], '05d') + '.csv')

        
        gt_reader = csv.reader(gt_file, delimiter=';')
        next(gt_reader)  

        for row in gt_reader:
            
            im = cv2.imread(prefix + row[0])
            
            if cut_roi:
                im = im[np.int(row[4]):np.int(row[6]),
                        np.int(row[3]):np.int(row[5]), :]

            X.append(im)
            labels.append(c)
        gt_file.close()
        
        
    X = _extract_feature(X, feature)

    np.random.seed(seed)
    np.random.shuffle(X)
    np.random.seed(seed)
    np.random.shuffle(labels)
    
    X_train = X[:int(len(X)*(1-test_split))]
    y_train = labels[:int(len(X)*(1-test_split))]
    X_test = X[int(len(X)*(1-test_split)):]
    y_test = labels[int(len(X)*(1-test_split)):]
    '''
    X_train = np.array(X_train).astype(np.float32) / 255
    # subtract mean
    X_train = [x - np.mean(x) for x in X_train]
    X_train = [x.flatten() for x in X_train]
    X_test = np.array(X_test).astype(np.float32) / 255
    # subtract mean
    X_test = [x - np.mean(x) for x in X_test]
    X_test = [x.flatten() for x in X_test]
    '''
    return (X_train, y_train), (X_test, y_test)
    

def _extract_feature(X, feature):
    #if feature == 'surf':
        #X = [cv2.cvtColor(x, cv2.COLOR_BGR2GRAY) for x in X]
    
    small_size = (32, 32)
    X = [cv2.resize(x, small_size) for x in X]
    X = np.array(X).astype(np.uint8)
    
   # X = noisy("s&p", X)
    X = np.array(X).astype(np.uint8)
    
    if feature == 'surf':
        surf = cv2.xfeatures2d.SURF_create(400)
        a = 18870
        i = 0 
        for i in range(a):
          kp = surf.detect(X[i], None)
          X[i] = cv2.drawKeypoints(X[i], kp, X[i])
        X = np.array(X).astype(np.float32) / 255
    elif feature == 'hog':
        block_size = (small_size[0] // 2, small_size[1] // 2)
        block_stride = (small_size[0] // 4, small_size[1] // 4)
        cell_size = block_stride
        num_bins = 9
        hog = cv2.HOGDescriptor(small_size, block_size, block_stride,
                                cell_size, num_bins)
        X = [hog.compute(x) for x in X]
    elif feature == None:
        X = np.array(X).astype(np.float32) / 255
        X = [x - np.mean(x) for x in X]
    X = [x.flatten() for x in X]
    return X
"""
def noisy(noise_type,image,gp1=0.9,spp=0.9,qup=0.9,b=2):

    if noise_type == "gauss":
        g = noise.GaussianNoise(gp1,scale = [0,255])
        noisy = g._apply(image)
        return noisy
    elif noise_type == "s&p":
        sp = noise.SaltAndPepperNoise(spp)
        noisy = sp._apply(image) 
        return noisy
    elif noise_type == "quantization":
        qu = noise.QuantizationNoise(qup)
        noisy = qu._apply(image)
        return noisy
    elif noise_type == "blurring":
        noisy = scipy.ndimage.gaussian_filter(image, sigma = b)
        return noisy 
"""
