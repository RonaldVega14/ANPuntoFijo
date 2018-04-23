pkg load symbolic;
warning('off', 'all');
#Declarando funciones que se usaran "f(x)=g(x) y g(x) = g'(x)"
syms f(x) g(x);
f(x) = sqrt(2*sqrt(x + 1));
g(x) = diff(f,x,1);

fx = function_handle(f);
fxd = function_handle(g);
#valores del intervalo
a = 1;
b = 2;
#valor de epsilon y se agrega un numero limite para las iteraciones
epsi = 0.001;
iteraciones = 100;


#comprobando primer criterio que g(a) y g(b) pertenezcan a [a,b]
a2 = fx(a); 
b2 = fx(b);



#comprobando segundo criterio que g'(a) y g'(b) sean ambos < 1
    a1 = fxd(a);
    b1 = fxd(b);

    #Encontrando K
        k = max(abs(a1), abs(b1));
        fprintf("El valor de K es: %f \n", k)
        #Asignando el valor de pn para la primera iteracion
        pn = (a+b)/2;
        #numero maximo de iteraciones segun formula
        den = max(b-pn, pn-a);
        nmax = log((epsi/den)) / log(k);
        fprintf("El numero de iteracion esperado es: %f \n", ceil(nmax));

        #Comenzando a iterar utilizando p0#
        printf("%15s | %15s | %15s | %15s |\n","n","Pn","Pn+1", "Error")
        cont = 0;
        while ( cont < iteraciones)
            pn1 = fxd(pn);
            err = abs(pn1 - pn);
            fprintf("%15f | %15f | %15f | %15f |\n", cont, pn, pn1, err);
            if( err <= epsi )
            pn = pn1;
            fprintf("La solucion encontrada es: %f \n", pn);
            break;
            endif
            pn = pn1;
            cont++;
        endwhile



