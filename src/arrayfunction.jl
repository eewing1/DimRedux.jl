function acceptlist()
    #take sucessive user inputs and store into matrix
    matrix_list=
    while true
        matrix_input=read() #don't know what function to use?
        if matrix_input="quit"
            break
        end
        push!(matrix_list, matrix_input)
    end
end


