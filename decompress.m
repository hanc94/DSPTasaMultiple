function x=decompress(x_c)
%Descompresor RLE

%índice para el arreglo de salida
x_c_index=1;
%Índice para el arreglo de entrada
x_index=1;
%Cantidad de ceros consecutivos
n_zeros=0;
%Cantidad de números diferentes a cero consecuentivos
n_no_zeros=0;

%Longitud del arreglo de entrada
N=length(x_c);

x=[];

%Ciclo principal   
while(1)    
    
    %El primer dato es la cantidad de ceros    
   x=[x zeros(1,x_c(x_c_index))];
   x_c_index=x_c_index+1;
   if(x_c_index>N) return; end
   %Cantidad de datos diferentes a cero
   NN=x_c(x_c_index);
   x_c_index=x_c_index+1;   
   x=[x x_c(x_c_index:(x_c_index+NN-1))];   
   x_c_index=x_c_index+NN;       
   
   if(x_c_index>N) return; end
      
end      
    
    
