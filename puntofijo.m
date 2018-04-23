pkg load symbolic;
warning('off', 'all');
#Declarando funciones que se usaran "f(x)=g(x) y g(x) = g'(x)"
syms f(x) g(x);
f(x) = 100*(((x/100)^(1.709219858156)) + 0.047571358811426)^ 0.705;
g(x) = diff(f,x,1);

fx = function_handle(f);
fxd = function_handle(g);
#valores del intervalo
a = 0;
b = 100;
#valor de epsilon y se agrega un numero limite para las iteraciones
epsi = 0.000000000000001;
iteraciones = 150;

#Encontrando K
        k = max(abs(a1), abs(b1));
        fprintf("El valor de K es: %f \n", k);
#Asignando el valor de pn para la primera iteracion
        pn = (a+b)/2;
#numero maximo de iteraciones segun formula
        den = max(b-pn, pn-a)
        nmax = log((epsi/den)) / log(k);
#       fprintf("El numero de iteracion esperado es: %f \n", ceil(nmax));

        #Comenzando a iterar utilizando pn
        printf("%15s | %15s | %15s | %15s |\n","n","Pn","Pn+1", "Error")
        cont = 0;
        while ( cont < iteraciones)
            pn1 = fxd(pn);
            err = abs(pn1 - pn);
            fprintf("%15f | %15f | %15f | %15e |\n", cont, pn, pn1, err);
            if( err <= epsi )
            pn = pn1;
            fprintf("La solucion encontrada es: %f \n", pn);
            break;
            endif
            pn = pn1;
            cont++;
        endwhile

