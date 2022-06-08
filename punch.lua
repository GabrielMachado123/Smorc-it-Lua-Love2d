function CreatePunch(x, y, w, h)
    return{position=vector2.new(x,y), size=vector2.new(w,h), attackSpeed= 0.2, damage=1, direction=1, attacking=false,
     grabbed=true,dropY= 0,cooldownTimer=0,cooldownDraw=0}
end