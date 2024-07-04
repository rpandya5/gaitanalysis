# gaitanalysis

## Motivation
Falls are the leading cause of injury death in adults aged 65 and over, causing about 38,000 deaths
and almost 3 million hospital visits in 2021 (for Disease Control & Prevention, 2024). Through
the synthesis of current deep learning techniques and gait (walking patterns) based data, our team
proposes a new and viable solution to predicting and preventing elderly falls. Gait data surrounding
elderly people can be recorded using gyroscopes and accelerometers located in cell phones or other
portable technologies. While mobile devices make this data easily accessible, it is often complex,
containing time series data and multiple sensors. Neural networks can easily extract and recognize
patterns, making it a good tool for analyzing the complex sensor data and returning an accurate
reading. Additionally, a neural network’s ability to learn over time allows it to scale well with large
amounts of data that other models may struggle with.
To accomplish our goal, the team will combine the efficiency of a CNN with the accuracy of an
LSTM to create our own hybrid model. The model will receive input from sensor readings (off
of the user’s phone) and output information that can be used as data for future research as well as
issue a notification to nearby emergency responders. The use of a neural network in this way should
significantly alleviate the pressure on both the patient and the emergency responders and help fall
victims to receive immediate and effective care.
## Project Illustration
![alt text](https://github.com/rpandya5/gaitanalysis/blob/main/images/project-illustration.png)
## Dataset
Our model has been trained on the SisFall Dataset. It contains accelerometer and gyroscope sensor data of 19 different types of ADL and 15 different types of Fall, performed by young and old adults. The data has been recorded using the ADXL345 and MMA8451Q accelerometers along with ITG3200 gyroscope. It has been sampled at 200 Hz and is stored in the form of text files containing the x, y and z directional components of all sensors. The procedure given below has been utilized to clean, process and extract all training and testing data. For more information, kindly access:
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5298771/
## Model Architecture (Brief Description)
Our model accepts a 3D tensor with dimensions (sample number,
time step, and feature type). This data first gets passed through three convolutional layers that each
increase in complexity to detect increasingly intricate features: the first layer has 64 filters, the
second layer has 128 filters, and the final layer has 256 filters. Each layer is followed by a ReLU
activation function, batch normalization and max pooling (pool size of 2).
The output from the CNN then gets passed into two LSTM layers - each with 100 units. After this,
the output is sent to a dense layer with 100 units and ReLU activation, a dropout layer with rate of
0.5, and the output layer is 1 unit with a sigmoid activation function to produce the accurate output
