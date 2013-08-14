
[spmatrix, tokenlist, trainCategory] = readMatrix('MATRIX.TRAIN.50');

trainMatrix = full(spmatrix);
numTrainDocs = size(trainMatrix, 1);
numTokens = size(trainMatrix, 2);

% trainMatrix is now a (numTrainDocs x numTokens) matrix.
% Each row represents a unique document (email).
% The j-th column of the row $i$ represents the number of times the j-th
% token appeared in email $i$. 

% tokenlist is a long string containing the list of all tokens (words).
% These tokens are easily known by position in the file TOKENS_LIST

% trainCategory is a (1 x numTrainDocs) vector containing the true 
% classifications for the documents just read in. The i-th entry gives the 
% correct class for the i-th email (which corresponds to the i-th row in 
% the document word matrix).

% Spam documents are indicated as class 1, and non-spam as class 0.
% Note that for the SVM, you would want to convert these to +1 and -1.


% YOUR CODE HERE
numSpam=0;
numHam=0;
condProbSpam=ones(1,numTokens);
condProbHam=ones(1,numTokens);

for n=1:numTrainDocs
    if full(trainCategory(n))==1
        numSpam=numSpam+1;
        condProbSpam=condProbSpam+trainMatrix(n,:);
    else
        numHam=numHam+1;
        condProbHam=condProbHam+trainMatrix(n,:);
    end
end
priorSpam=numSpam/numTrainDocs;
priorHam=1-priorSpam;

sumSpam=sum(condProbSpam);
sumHam=sum(condProbHam);
condProbSpam=condProbSpam/sumSpam;
condProbHam=condProbHam/sumHam;



