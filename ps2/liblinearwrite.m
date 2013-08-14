function liblinearwrite(inputfile, outputfile)
% Converts a data file from CS229 format to LIBLINEAR format.
% example usage: libsvmwrite('MATRIX.TRAIN', 'MATRIX.TRAIN.LIBLINEAR')
[spmatrix, tokenlist, category] = readMatrix(inputfile);
testMatrix = full(spmatrix);
numTestDocs = size(testMatrix, 1);
fid = fopen(outputfile, 'w');

for i=1:numTestDocs,
  label = category(i);
  if(label == 0),
    fprintf(fid, '-1 ');
  end
  if(label == 1),
    fprintf(fid, '1 ');
  end
  [I,J,V] = find(spmatrix(i,:)); 
  numNonZero = size(J, 2);
  for j=1:numNonZero,
    fprintf(fid, ' %d:%d', J(j), full(spmatrix(i, J(j))));
  end
  fprintf(fid, '\n');
end
