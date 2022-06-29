function [newData] = cut_info(data,ajuste)

tamanyo = size(ajuste);
tamanyo = tamanyo(2);
newData = [];
i = 1;
while i<=tamanyo
    newData(1,i) = data(ajuste(1,i));
    i = i + 1;
end

end

