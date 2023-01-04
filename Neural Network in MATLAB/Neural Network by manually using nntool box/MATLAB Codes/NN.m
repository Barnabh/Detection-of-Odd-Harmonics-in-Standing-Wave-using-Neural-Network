clc;
clear all;
close all;

input = 0:0.05:10; % Defining input neuron to the Neural Network
output = input.^2; % Defining output neuron to the Neural Network

net = newff(minmax(input), [20, 1], {'logsig', 'purelin', 'trainlm'});

%{
Create a feed-forward backpropagation network

Syntax
net = newff

net = newff(PR,[S1 S2...SNl],{TF1 TF2...TFNl},BTF,BLF,PF)

Description
net = newff creates a new network with a dialog box.

newff(PR,[S1 S2...SNl],{TF1 TF2...TFNl},BTF,BLF,PF) takes,

PR -- R x 2 matrix of min and max values for R input elements

Si -- Size of ith layer, for Nl layers

TFi -- Transfer function of ith layer, default = 'tansig'

BTF -- Backpropagation network training function, default = 'traingdx'

BLF -- Backpropagation weight/bias learning function, default = 'learngdm'

PF -- Performance function, default = 'mse'

and returns an N layer feed-forward backprop network.

The transfer functions TFi can be any differentiable transfer function such as tansig, logsig, or purelin.

The training function BTF can be any of the backprop training functions such as trainlm, trainbfg, trainrp, traingd, etc.

Caution: trainlm is the default training function because it is very fast, but it requires a lot of memory to run. If you get an "out-of-memory" error when training try doing one of these:
Slow trainlm training, but reduce memory requirements by setting net.trainParam.mem_reduc to 2 or more. (See help trainlm.)
Use trainbfg, which is slower but more memory-efficient than trainlm.
Use trainrp, which is slower but more memory-efficient than trainbfg.
The learning function BLF can be either of the backpropagation learning functions such as learngd or learngdm.

The performance function can be any of the differentiable performance functions such as mse or msereg.

Examples
Here is a problem consisting of inputs P and targets T that we would like to solve with a network.

P = [0 1 2 3 4 5 6 7 8 9 10];
T = [0 1 2 3 4 3 2 1 2 3 4];
Here a two-layer feed-forward network is created. The network's input ranges from [0 to 10]. The first layer has five tansig neurons, the second layer has one purelin neuron. The trainlm network training function is to be used.

net = newff([0 10],[5 1],{'tansig' 'purelin'});
Here the network is simulated and its output plotted against the targets.

Y = sim(net,P);
plot(P,T,P,Y,'o')
Here the network is trained for 50 epochs. Again the network's output is plotted.

net.trainParam.epochs = 50;
net = train(net,P,T);
Y = sim(net,P);
plot(P,T,P,Y,'o')
%}

net.trainparam.epochs = 10000; % Setting number of epochs.
net.trainparam.goal = 1e-30; % Setting our neural network performance that is the loss ratio minimisation, how much loss ratio can be reduced.
net.trainparam.lr = 0.01; % Setting learning rate.

net = train(net, input, output); % Training neurl network by train(1, 2, 3), where 1 is Neural Network -> net, 2 is input parameter, 3 is output parameter or target parameter.

figure (1)
hold on % as long as hold on all plots will be plotted in the same graph until you type hold off.
plot(output)
plot(net(input))

output1 = net(input);

error = (output1 - output).^2; % calculating the loss ratio and it's graph.

figure (2)
plot(error)
