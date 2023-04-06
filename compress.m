function x_c=compress(x)
%Compresor RLE

%índice para el arreglo de salida
x_c_index=1;
%Índice para el arreglo de entrada
x_index=1;
%Cantidad de ceros consecutivos
n_zeros=0;
%Cantidad de números diferentes a cero consecuentivos
n_no_zeros=0;

%Longitud del arreglo de entrada
N=length(x);



%Ciclo principal   
while(1)    
    
    %Se cuentan los ceros
    while (1)        
        if(x(x_index)==0)
            n_zeros=n_zeros+1;

            
            %Si se recorrió todo el arreglo se retorna
            if(x_index==N) 
                x_c(x_c_index)=n_zeros;      
               return; 
            end
             x_index=x_index+1;
        else
            x_c(x_c_index)=n_zeros;
            x_c_index=x_c_index+1;
            n_zeros=0;
            break;
        end
       
        
        
    end
    
    %Se cuentan los diferentes de ceros
      while (1)        
        if(x(x_index)~=0)
            n_no_zeros=n_no_zeros+1;

            %Si se recorrió todo el arreglo se retorna            
            if(x_index==N) 
              x_index=x_index+1;
            x_c(x_c_index)=n_no_zeros;
            x_c((x_c_index+1):(x_c_index+n_no_zeros))=x((x_index-n_no_zeros):(x_index-1));            
               return; 
            end
            x_index=x_index+1;
        else
            x_c(x_c_index)=n_no_zeros;
            x_c((x_c_index+1):(x_c_index+n_no_zeros))=x((x_index-n_no_zeros):(x_index-1));
            x_c_index=x_c_index+n_no_zeros+1;
            n_no_zeros=0;
            break;
        end
        
     
      end
    
      
end      
    
    
