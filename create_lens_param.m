% create_lens - Računanje utjecaja leće na jedinicni signal
%
% Poziva se:
%    [T] = crate_lens
% gdje je
%    sample_distance    - Razmak izmedu uzoraka (frekvencija uzrokovanja)
%    k      			- Valni broj
%    D_max      		- Maksimalna debljina lece
%    lens_dimension  	- Velicina lece
%    n     				- Indeks loma materijala od kojeg je leca napravljena
%
% Algoritam
%		Fazna transformacija koja nastaje zbog lece na dvodimenzionalni jedinicni signal.
% 		T(x,y)= k*n*D(x,y)+k*[D_max - D(x,y)]
% 		T = exp(1i*k*D_max)*exp(D.*1i*k*(n-1));(izraz 5-1 Introduction to Fourier Optics, Goodman 1996.).
%
% Napomene:
%   1. Pretpostavlja se da je velicina lece kvadratna (lens_dimensio x lens_dimension)
function [ T ] = create_lens_param( sample_distance ,k, D_max, f, lens_dimension ,n )
	[D,D_max] = prism_thickness(1024,1024,20,sample_distance);
	T = exp(1i*k*D_max)*exp(D.*1i*k*(n-1));
end

