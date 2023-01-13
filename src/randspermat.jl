function randspermmat(n)
    #return signed permutation matrix of size nxn
    SparseMatrixCSC(n, n,collect(1:n+1), shuffle(1:n), (-1).^rand(Bool,n))
end


function createfft(N)
    #return discrete Fourier Transform matrix of size NxN
    rnd = rand(1:100, N, N);
    fft(rnd)
end
