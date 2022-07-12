local shapes = {}

function shapes.bevelsquare(x, y, w, h, r)
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

function shapes.bevelsquarecollision(x, y, w, h, r, mx, my)
    local rd = math.sqrt(r^2/2)
    local rw, rh = w-2*r-2*rd, h-2*r-2*rd
    local rx, ry = x+r+rd, y+r+rd
    local t = false

    circles = {
        {x = rx-rd, y = ry-rd},
        {x = rx+rw+rd, y = ry-rd},
        {x = rx-rd, y = ry+rh+rd},
        {x = rx+rw+rd, y = ry+rh+rd}
    }

    rects = {
        {x = rx-r-rd, y = ry-rd, w = 2*r, h = rh+2*rd},
        {x = rx+rw+rd-r, y = ry-rd, w = 2*r, h = rh+2*rd},
        {x = rx-rd, y = ry-rd-r, w = rw+2*rd, h = r+rd},
        {x = rx-rd, y = ry+rh, w = rw+2*rd, h = r+rd}
    }

    for i=1, #circles do
        if math.sqrt((mx-circles[i].x)^2+(my-circles[i].y)^2) < r then
            t = true
        end
    end

    for i=1, #rects do
        if mx < rects[i].x + rects[i].w and mx > rects[i].x and my > rects[i].y 
        and my < rects[i].y + rects[i].h then
            t = true
        end
    end

    return t
end

return shapes
