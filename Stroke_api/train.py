import joblib
from sklearn.linear_model import LogisticRegression
import pandas as pd
from sklearn.model_selection import train_test_split

data = pd.read_csv('readyto_ML.csv')
df = data.copy()
x = df.drop(columns = ['id', 'ever_married', 'stroke',"Unnamed: 0"])
y = df['stroke']
print(x)
x_train, x_test, y_train, y_test = train_test_split(x, y, random_state=42, test_size = 0.2, shuffle=True)
final_model = LogisticRegression(C=1, class_weight=None, dual=False, fit_intercept=True,
                   intercept_scaling=1, l1_ratio=None, max_iter=100,n_jobs=None, penalty='l2',
                   random_state=None, solver='liblinear', tol=0.0001, verbose=0,
                   warm_start=False)
final_model.fit(x_train, y_train)
# print(f'The accuracy on training data : {round(final_model.score(x_train, y_train),100, 2)} %')
# print(f'The accuracy on test data : {round(final_model.score(x_test, y_test),100, 2)} %')
# # Lets save our model
joblib.dump(final_model, 'pickled_model.pkl')

print('Done')