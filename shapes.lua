local shapes = {}

function shapes.bezel(x, y, w, h, r)
    if r > h/2 then error('Radius of bezel is too big. Radius must be less than half the height.') end
    local rd = math.sqrt(r^2/2) --radius diagonal
    local rw, rh = w-2*r-2*rd, h-2*r-2*rd --rectangle width, height
    local rx, ry = x+r+rd, y+r+rd --rectangle x, y
    love.graphics.rectangle('fill', rx, ry, rw, rh)

    --corners
    love.graphics.circle('fill', rx-rd, ry-rd, r)
    love.graphics.circle('fill', rx+rw+rd, ry-rd, r)
    love.graphics.circle('fill', rx-rd, ry+rh+rd, r)
    love.graphics.circle('fill', rx+rw+rd, ry+rh+rd, r)

    --sides
    love.graphics.rectangle('fill', rx-r-rd, ry-rd, 2*r, rh+2*rd)
    love.graphics.rectangle('fill', rx+rw+rd-r, ry-rd, 2*r, rh+2*rd)
    love.graphics.rectangle('fill', rx-rd, ry-rd-r, rw+2*rd, r+rd)
    love.graphics.rectangle('fill', rx-rd, ry+rh, rw+2*rd, r+rd)
end

return shapes
