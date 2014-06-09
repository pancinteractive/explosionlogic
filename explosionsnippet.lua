-- Quick snippet of explosion logic 

	local function pixelBurst(objEnem)
    local function DestroyPop(Obj)
        display.remove(Obj)
        Obj = nil
	end
	timer.performWithDelay(5, function()
			local function createParts()
				timer.performWithDelay(5, function()
					local starRnd = math.random
					local partDown = display.newRect(0,0,5,5)
					partDown:setFillColor(200,200,0)
					physics.addBody( partDown, "dynamic",{ density = 1.5, isSensor=true } )
					partDown.x = objEnem.x+(starRnd(-5, 5))
					partDown.y = objEnem.y
					partDown:applyForce(1*(starRnd(-5,5)),-13, partDown.x*(starRnd(1,10)), partDown.y)
					partDown:applyTorque(5*starRnd(5,10))
					transition.to(partDown, {time=1500, onComplete=DestroyPop})
					return partDown
				end, 15)
			end
		createParts()
		end, 1)
	end
