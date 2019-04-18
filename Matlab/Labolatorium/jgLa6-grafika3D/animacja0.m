
function animacja0
%Matlab umo¿liwia bardzo ³atwe tworzenie animacji wykresów.
%Ka¿de polecenie plot generuje nowe okno.
% Zawartoœæ tego okna mo¿na przy pomocy polecenie
% getframe zapisaæ np.: w tablicy.
% Utworzon¹ tablicê odtworzamy
% wykorzystuj¹c polecenie movie().
for k = 1:16
plot(fft(eye(k+16)))
axis equal
M(k) = getframe;
end
movie(M,10);

return

% fft - discrete Fourier transform.
%    fft(X) is the discrete Fourier transform (DFT) of vector X.  For
%    matrices, the fft operation is applied to each column. For N-D
%    arrays, the fft operation operates on the first non-singleton
%    dimension.
%    fft(X,N) is the N-point fft, padded with zeros if X has less
%    than N points and truncated if it has more.
%    fft(X,[],DIM) or fft(X,N,DIM) applies the fft operation across the
%    dimension DIM.
%    For length N input vector x, the DFT is a length N vector X,
%    with elements
%       X(k) =       sum  x(n)*exp(-j*2*pi*(k-1)*(n-1)/N), 1 <= k <= N.
%                    n=1
%    The inverse DFT (computed by IFFT) is given by
%                     N
%       x(n) = (1/N) sum  X(k)*exp( j*2*pi*(k-1)*(n-1)/N), 1 <= n <= N.
%                    k=1
 %
 % movie  Play recorded movie frames.
 %   movie(M) plays the movie in matrix M once, using the current axes
 %   as the default target. To play the movie in the figure instead of
 %   the axes, specify the figure handle (or gcf) as the first
 %   argument: movie(figure_handle,...). M must be an array of movie
 %   frames (usually from getframe).
 %   movie(M,N) plays the movie N times. If N is negative, each
 %   "play" is once forward and once backward. If N is a vector,
 %   the first element is the number of times to play the movie and
 %   the remaining elements comprise a list of frames to play
 %   in the movie. For example, if M has four frames then
 %   N = [10 4 4 2 1] plays the movie ten times, and the movie
 %   consists of frame 4 followed by frame 4 again, followed by
 %   frame 2 and finally frame 1.
 %   movie(M,N,FPS) plays the movie at FPS frames per second. The
 %   default if FPS is omitted is 12 frames per second. Machines
 %   that can't achieve the specified FPS play as fast as they can.
 %    movie(H,...) plays the movie in object H, where H is a handle
 %   to a figure, or an axis.
 %   movie(H,M,N,FPS,LOC) specifies the location to play the movie
 %   at, relative to the lower-left corner of object H and in
 %   pixels, regardless of the value of the object's Units property.
 %   LOC = [X Y unused unused].  LOC is a 4-element position
 %   vector, of which only the X and Y coordinates are used (the
 %   movie plays back using the width and height in which it was
 %   recorded).  All four elements are required, however.
 %
    %getframe Get movie frame.
    %getframe returns a movie frame. The frame is a snapshot
    %of the current axis. getframe is usually used in a FOR loop 
    %to assemble an array of movie frames for playback using MOVIE.  
    %For example:
    %   for j=1:n
    %      plot_command
    %      M(j) = getframe;
    %   end
    %   movie(M)
    %getframe(H) gets a frame from object H, where H is a handle
    %to a figure or an axis.
    %getframe(H,RECT) specifies the rectangle to copy the bitmap
    %from, in pixels, relative to the lower-left corner of object H.
    %F = getframe(...) returns a movie frame which is a structure 
    %having the fields "cdata" and "colormap" which contain the
    %the image data in a uint8 matrix and the colormap in a double
    %matrix. F.cdata will be Height-by-Width-by-3 and F.colormap  
    %will be empty on systems that use TrueColor graphics.  
    %For example:
    %    f = getframe(gcf);
    %   colormap(f.colormap);
    %   image(f.cdata);
 
 
