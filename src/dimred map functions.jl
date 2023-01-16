function randspermmat(n)
    """return signed permutation matrix of size nxn"""
    SparseMatrixCSC(n, n,collect(1:n+1), shuffle(1:n), (-1).^rand(Bool,n))
end


function discretefft(N)
    """"return discrete Fourier Transform matrix of size NxN"""
    rnd = rand(1:100, N, N);
    fft(rnd)
end

function createfft(k,m,s,n)
    Υ=discretefft(m)
end


function ssrft(a,b)
    """Return ssrft matrix of dimensions axb
       Dimension reduction map"""
    Π=randspermmat(N)
    Π'=randspermat(N)
       
    fft(matrix)
    #apply fft to identity
    #fft algorithm has been highly optimized
end

function createssrft()
    """Return four element tuple of srft matrices"""
    Υ=gaussian(k,m)
    Ω=gaussian(k,n)
    Φ=gaussian(s,m)
    Ψ=gaussian(s,n)
    return (Υ,Ω,Φ,Ψ)
end




function gaussian(a,b)
    """Return gaussian matrix of dimensions axb
       Dimension reduction map"""
     return randn(a,b)
 end 

function creategauss(k,m,s,n)
    """Return four element tuple of gaussian test matrices"""
    Υ=gaussian(k,m)
    Ω=gaussian(k,n)
    Φ=gaussian(s,m)
    Ψ=gaussian(s,n)
    return (Υ,Ω,Φ,Ψ)
end



function sparsesign(a,b,ζ)
    """Return sparse sign matrix of dimensions axb
        Dimension reduction map"""
    #check zeta parameter
    #want to build a matrix of size axb
    #generate upsilon, kxm matrix
    matrix=Complex.(zeros(a,b))
    for x=1:b
        col=Complex.(zeros(a))
        #pick coordinates, entries of column vector 
        crds=sample(range(1,a), ζ; replace=false)
        numbers=exp.((2*im*π).*rand(ζ))
        #now insert these numbers into each column
        for z=1:a
            if z in crds
                col[z]=pop!(numbers)
        ``  end
        end
        matrix[:,x]=col
    end
    return matrix
end



function createsparsesign(k,n,s,n)
    """Return four element tuple of sparse sign test matrices"""
    Y=sparsesign(k,m)
    Ω=sparsesign(k,n)
    Φ=sparsesign(s,m)
    Ψ=sparsesign(s,n)
    return (Υ,Ω,Φ,Ψ)
end




