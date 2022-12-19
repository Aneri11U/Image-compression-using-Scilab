original_im = im2double(rgb2gray(imread("pic3.jpg")));

[U,S,V,rk] = svd(original_im);

singular_values = diag(S);

singular_dimension_using = [5,10,15,20,25,30,40,50];

percent_highdimension_using = [1, 70, 0.2];

no_of_columns = 4;

no_of_plots = 1 + length(singular_dimension_using)+ length(percent_highdimension_using);

no_of_rows = no_of_plots/no_of_columns;

if(modulo(no_of_plots,no_of_columns) <> 0)then
    no_of_rows = no_of_rows+1;
end

f = scf(1);

clf(1);

f.figure_name= "SVD Image Compression Output";

subplot(no_of_rows,no_of_columns,1);

imshow(original_im)

xtitle(['Original Image';  string(rk) + ' singular_dimensions'])

for i = 1:length(singular_dimension_using)
   singular_dimension = singular_dimension_using(i);
   new_im = U(:, 1:singular_dimension)*S(1:singular_dimension, 1:singular_dimension)*V(:, 1:singular_dimension)' ; 
   error=singular_values(singular_dimension+1);
   subplot(no_of_rows,no_of_columns,i+1);
   imshow(new_im);
   imwrite(new_im,'pic3compress1.jpg');
   xtitle([string(singular_dimension)+' singular_dimensions'; 'Spectral Norm Error = ' + string(error)]);
end

for j = 1:length(percent_highdimension_using)
    percent_using = percent_highdimension_using(j);
   indices_of_singular_values = find(singular_values > (percent_using/100)*max(singular_values));
   new_im = U(:, indices_of_singular_values)*S(indices_of_singular_values,indices_of_singular_values)*V(:, indices_of_singular_values)';
   singular_dimension = length(indices_of_singular_values);
   error=singular_values(singular_dimension+1); 
   subplot(no_of_rows,no_of_columns,1+length(singular_dimension_using)+j);
   imshow(new_im);
   xtitle([string(singular_dimension) + ' singular_dimensions'; string(percent_using) + '% of highest singular_dimension' ; 'Spectral Norm Error = ' + string(error)])
end





