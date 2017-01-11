;***********************************************
; find_ind_near_close.ncl
;
; Concepts illustrated:
;   - Encontra o ind mais próximo de um valor 
; especifico para uma variável bidimensional
;***********************************************

function closest_val_AnyOrder(xVal[1]:numeric, x:numeric)
    local xAbsDif, xMinVal, iClose
    begin
      xAbsDif = abs(xVal-x)
      xMinVal = min(xAbsDif)
      i       = ndtooned(xAbsDif)
      dsizes  = dimsizes(xAbsDif)
      iClose  = ind_resolve(ind(i.eq.xMinVal),dsizes)
      return(iClose)   ; original doc says "first occurrence"
    end


function indbi(value[1]:numeric,var:numeric)
    local value, var, inds
    begin

    inds = closest_val_AnyOrder(value, var)

    ;print(inds)
    print(var(inds(0,0),inds(0,1)))

    return(inds)

    end