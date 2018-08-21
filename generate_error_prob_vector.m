% Definition of error mode: pq=qubit error prob, ps =syndrome error prob
% (a) pq=ps=pm
% (b) pq=pm, ps=(1-(1-2pm)^wt(g))/2; pq<<ps
% (c) pq=(1-(1-2pm)^(n/2))/2, ps =pm; pq>>ps
% (d) ps=(1-(1-2pm)^wt(g))/2,pq=(1-(1-2pm)^(n/2))/2; pq =~ 10 ps

function error_prob = generate_error_prob_vector(errorModel,numInputSymbols,pm,weightP)
%generate radnom error from given error model/probability distribution
%return a vector of pq and ps

length = size(numInputSymbols,2);
 error_prob=zeros(1,length);
switch errorModel
    case 'a'
        for i =1:length         
             error_prob(i) = pm;                
        end
    case 'b'         
        for i =1:length
            switch numInputSymbols(i)
                case 2
                    error_prob(i) = (1-(1-2*pm)^weightP(i))/2;
                case 4              
                    error_prob(i)=pm;
            end
        end
    case 'c'      
        n= -sum(numInputSymbols/2-2);%average number of gate operations on qubits in between each error correction circle
        for i =1:length
            switch numInputSymbols(i)
                case 2
                    error_prob(i) = pm;
                case 4 
                    error_prob(i)=(1-(1-2*pm)^(n/2))/2;
            end
        end
    case 'd'
        n= -sum(numInputSymbols/2-2);%average number of gate operations on qubits in between each error correction circle
        for i =1:length
            switch numInputSymbols(i)
                case 2
                    error_prob(i) = (1-(1-2*pm)^weightP(i))/2;
                case 4 
                    error_prob(i)=(1-(1-2*pm)^(n/2))/2;
            end
        end
        
        
        
end
end     