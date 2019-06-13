export size, ztr

"""
    size(model::StateSpaceModel)

Return the dimensions `n`, `p`, `m` and `r` of the `StateSpaceModel`
"""
function size(model::StateSpaceModel)
    return model.dim.n, model.dim.p, model.dim.m, model.dim.r
end

"""
    matrices(model::StateSpaceModel)

Return the state space model arrays `Z`, `T` and `R` of the `StateSpaceModel`
"""
function ztr(model::StateSpaceModel)
    return model.Z, model.T, model.R
end

function fast_triangular_X_Xtranspose(X::Matrix{Float64})
    return LinearAlgebra.BLAS.trmm('R', 'L', 'T', 'N', 1.0, X, X)
end

