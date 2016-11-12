function [frecuenciaMaxima, maximasPotenciasY, maximasPotenciasX, Espectro, f] = espectroPotencia ( Senal ,fmuestreo )
    % Esta funci�n permite determinar y graficar el espectro en frecuencia 
    % de una se�al en el tiempo que es recibida como par�metro llamado
    % Senal, con su respectiva frecuencia de muestreo fmuestreo.
    % La funci�n retorna el valor al cual se encuentra la m�xima potencia.
    
    NFFT = 2^nextpow2(length(Senal)); % Next power of 2 from length of y
    Transformada = fft(Senal,NFFT)/length(Senal);
    f = round(fmuestreo/2*linspace(0,1,NFFT/2+1));
    Espectro = abs(Transformada(1:NFFT/2+1));
    
    % Para poder ver el compartamiento en frecuencia, se filtrar� el DC (
    % 0Hz) con esto suprimeros los primeros 2% datos. 
    cantidadFiltrar = length(Espectro)*0.02;
    Espectro(1:ceil(cantidadFiltrar)) = 0;% El primer 2% de valores se 
    %tomaran como cero, para as� suprimir el valor DC de la se�al. 
   
    frecuenciaMaxima = 0 ;
    % Potencias m�s altas en el espectro, de mayor a menor.
    maximasPotenciasA = sort(Espectro,'descend'); 
    
    % Obtenemos las 3 mas altas
    for i=1:1:4
        maximasPotenciasY(1,i) = maximasPotenciasA(1,i);
    end
    
    %Obtenemos posicion de las 3 frecuencias mas altas
    for i=1:1:4
        tempA = find(Espectro == maximasPotenciasY(1,i));
        maximasPotenciasX(1,i) = f(tempA); %Redondeamos las frecuencias
    end
  end 