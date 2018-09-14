import data
import numpy as np
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score
from sklearn.model_selection import GridSearchCV
from sklearn.neighbors import NearestNeighbors
from sklearn.neighbors import KNeighborsClassifier
from sklearn.tree import DecisionTreeClassifier
(X_train, y_train), (X_test, y_test) = data.load_data(
    "C:/Users/PLALKAR1/Documents/GTSRB_Final_Training_Images/GTSRB/Final_Training/Images",
    feature='hog',
    test_split=0.2,
    seed=42)

X_train = np.squeeze(np.array(X_train)).astype(np.float32)
y_train = np.array(y_train)
X_test = np.squeeze(np.array(X_test)).astype(np.float32)
y_test = np.array(y_test)

labels = np.unique(np.hstack((y_train, y_test)))

'''
clf = SVC(C=10000.0, cache_size = 200,class_weight='balanced',coef0 = 0.0,
          decision_function_shape = 'ovr',degree =3, gamma = 0.01, kernel= 'rbf'
          ,max_iter = -1,probability = False, random_state=None, shrinking=True,
          tol=0.001,verbose =False)
'''
#clf = SVC(kernel='rbf', class_weight='balanced')
#clf = KNeighborsClassifier()
clf = DecisionTreeClassifier()

clf = clf.fit(X_train, y_train)
y_pred = clf.predict(X_test)
score = accuracy_score(y_test, y_pred)
print(score)
