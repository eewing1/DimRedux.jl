function randspermmat(n)
    SparseMatrixCSC(n, n,collect(1:n+1), shuffle(1:n), (-1).^rand(Bool,n))
end
