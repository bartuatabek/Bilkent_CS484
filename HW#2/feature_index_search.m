function order_result = feature_index_search(image, option, bagOfWords1, bagOfWords2, bagOfWords3, bagOfWords4, bagOfWords5, bagOfWords6)
if option == 1
    bagOfW = bagOfWords1{image};
    result = [];
    for i=1:1000
       result(i) = sqrt(sum((bagOfW - bagOfWords1{i}).^2)); 
    end
    
    [~, order_result] = sort(result);
elseif option == 2
    bagOfW = bagOfWords2{image};
    result = [];
    for i=1:1000
       result(i) = sqrt(sum((bagOfW - bagOfWords2{i}).^2)); 
    end
    
    [~, order_result] = sort(result); 
elseif option == 3
    bagOfW = bagOfWords3{image};
    result = [];
    for i=1:1000
       result(i) = sqrt(sum((bagOfW - bagOfWords3{i}).^2)); 
    end

    [~, order_result] = sort(result);
elseif option == 4
    bagOfW = bagOfWords3{image};
    result = [];
    for i=1:1000
       result(i) = sqrt(sum((bagOfW - bagOfWords3{i}).^2)); 
    end
    
    [~, order_result] = sort(result);
elseif option == 5
    bagOfW = bagOfWords5{image};
    result = [];
    for i=1:1000
       result(i) = sqrt(sum((bagOfW - bagOfWords5{i}).^2)); 
    end
    
    [~, order_result] = sort(result);
elseif option == 2
    bagOfW = bagOfWords6{image};
    result = [];
    for i=1:1000
       result(i) = sqrt(sum((bagOfW - bagOfWords6{i}).^2)); 
    end

    [~, order_result] = sort(result);
end