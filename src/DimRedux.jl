module DimRedux

using LinearAlgebra
using StatsBase #generate random dist
using SparseArrays #generate signed permutation
using Random #need for signed permutation

function tropp(t,r,k,s,x...)
    #consider the data stream as the user entering their info as arguments into the varargs function
    #draw and fix four randomized linear dimension reduction maps
    #m is number of rows, n is number of columns
    #compute the result of one addition, then set 
        #write recursive function
        #add the one you have already computed and next piece of data
        #input is matrix, sequence of vectors 
        #can have input be data matrix, and then parameters like s,k,r, sketching and resampling
        #want subfunction that just computes result of matrix A*b
    m=size(x[1],1)
    n=size(x[1],2)
    if t==G
        Υ=gaussian(k,m)
        Ω=gaussian(k,n)
        Φ=gaussian(s,m)
        Ψ=gaussian(s,n)
    end

    #sketch itself consists of three matrices
    #update the sketch w/ for loop
    X=upsilon*x[1]
    Y=x[1]*omega'
    Z=phi*x[1]*psi'

    #if user gives us more than one matrix in data stream
    if length(x)>1
        for matrix in 2:length(x)
            X=X+upsilon*x[matrix]
            Y=Y+x[matrix]*omega'
            Z=Z+phi*x[matrix]*psi'
        end
    end


    #the tuple (X,Y,Z) is a sketch of our input matrix a
    P,R₁=qr(X')
    Q,R₂=qr(Y)


    C=pinv(phi*Q)*Z*(pinv(psi*P))'

    #now acquire rank k approximation of input matrix a
    Â=Q*C*P'

    #compute best rank r approximation of matrix A
    C̃ᵣ=lowrankapprox(C,r)
    Ãᵣ=Q*C̃ᵣ*P'

    #this matrix is the truncated approximation
end

function lowrankapprox(C,r)
    """compute rank r approximation of given matrix C"""
    C_svd=svd(C)
    C̃ᵣ=(C_svd.U[:,1:r])*Diagonal(C_svd.S[1:r])*(C_svd.V[:,1:r])'
end


crds=sample(range(1,10), 3; replace=false)
numbers=exp.((2*im*π).*rand(3))
col=Complex.(zeros(10))
col[1]=pop!(numbers)


function tropp2(r,k,s,x...)
    #consider the data stream as the user entering their info as arguments into the varargs function
    #draw and fix four randomized linear dimension reduction maps
    #m is number of rows, n is number of columns
    m=size(x[1],1)
    n=size(x[1],2)

    upsilon=sparsesign(k,m,2)
    omega=sparsesign(k,n,2)
    phi=sparsesign(s,m,2)
    psi=sparsesign(s,n,2)

    #sketch itself consists of three matrices
    #update the sketch w/ for loop
    X=upsilon*x[1]
    Y=x[1]*omega'
    Z=phi*x[1]*psi'

    #if user gives us more than one matrix in data stream
    if length(x)>1
        for matrix in 2:length(x)
            X=X+upsilon*x[matrix]
            Y=Y+x[matrix]*omega'
            Z=Z+phi*x[matrix]*psi'
        end
    end


    #the tuple (X,Y,Z) is a sketch of our input matrix a
    P,R₁=qr(X')
    Q,R₂=qr(Y)


    C=pinv(phi*Q)*Z*(pinv(psi*P))'

    #now acquire rank k approximation of input matrix a
    Â=Q*C*P'

    #compute best rank r approximation of matrix A
    C_svd=svd(C)
    C̃ᵣ=(C_svd.U[:,1:r])*Diagonal(C_svd.S[1:r])*(C_svd.V[:,1:r])'

    Ãᵣ=Q*C̃ᵣ*P'

    #this matrix is the truncated approximation
end
end
