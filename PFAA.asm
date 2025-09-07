spile segment para stack
    db 256 dup(?)
    bpile dw 256  ; ou EQU 256
spile ends

code segment
    assume cs:code, ss:spile

defmod proc near
    mov ah, 0
    int 10h
    ret
defmod endp

putPixel proc near
    mov ah,12
    int 10h
    ret
putPixel endp

drawhl proc near
    add si,cx
enp: 
    call putPixel
    inc cx
    cmp cx,si
    jl enp
    ret
drawhl endp

drawvl proc near
    add si,dx
enpv: 
    call putPixel
    inc dx
    cmp dx,si
    jl enpv
    ret
drawvl endp

drawolR proc near
    add si,cx
enpR: 
    call putPixel
    inc cx
    inc dx
    cmp cx,si
    jl enpR
    ret
drawolR endp

drawolL proc near
    add si,dx
enpL: 
    call putPixel
    inc dx
    dec cx
    cmp dx,si
    jl enpL
    ret
drawolL endp    



; Dessiner les mains de l'avatar
drawHands proc near
    ; D?finir la couleur des mains
    mov al, 9 ; par exemple, 6 pour la couleur cyan

    ; Dessiner la main gauche
    ; Base de la main gauche
    mov cx, 120
    mov dx, 120
    mov si, 20
    call drawolR

    ; Dessiner la main droite
    ; Base de la main droite
    mov cx, 120
    mov dx, 120
    mov si, 20
    call drawolL

    ret
drawHands endp







; Dessiner les pieds de l'avatar
drawFeet proc near
    ; D?finir la couleur des pieds
    mov al, 7 ; par exemple, 4 pour la couleur rouge

    ; Dessiner le pied gauche
    ; Partie sup?rieure du pied gauche
    mov cx, 81
    mov dx, 170
    mov si, 10
    call drawolR

    ; Partie inf?rieure du pied gauche
    mov al, 9
    mov cx, 120
    mov dx, 150
    mov si, 30
    call drawolL

   

    ; Dessiner le pied droit
    ; Partie sup?rieure du pied droit
    mov al, 7
    mov cx, 158
    mov dx, 170
    mov si, 10
    call drawolL

    ; Partie inf?rieure du pied droit
    mov al, 9
    mov cx, 120
    mov dx, 150
    mov si, 30
    call drawolR

  

    ret
drawFeet endp









    
debut:  
    mov al,13h
    call defmod
    ;HEAD
    ;1st horizontal line 
    mov al,15
    mov cx,100
    mov dx,70
    mov si,40
    call drawhl
    ;2nd horizontal line 
    mov al,15
    mov cx,100
    mov dx,110
    mov si,40
    call drawhl
    
    ;1st vertical line 
    mov al,15
    mov cx,100
    mov dx,70
    mov si,40
    call drawvl
    ;2nd vertical line 
    mov al,15
    mov cx,140
    mov dx,70
    mov si,40
    call drawvl
    
    ;EYES
    ;LEFT EYE
    
    ;1st horizontal line 
    mov al,7
    mov cx,106
    mov dx,85
    mov si,5
    call drawhl
    ;2nd horizontal line 
    mov al,7
    mov cx,106
    mov dx,90
    mov si,5
    call drawhl
    
    ;1st vertical line 
    mov al,7
    mov cx,105
    mov dx,85
    mov si,5
    call drawvl
    ;2nd vertical line 
    mov al,7
    mov cx,110
    mov dx,85
    mov si,5
    call drawvl
    
    
    ;RIGHT EYE
    
    ;1st horizontal line
    mov al,7
    mov cx,130
    mov dx,85
    mov si,5
    call drawhl
    ;2nd horizontal line
    mov al,7
    mov cx,130
    mov dx,90
    mov si,5
    call drawhl
    
    ;1st vertical line 
    mov al,7
    mov cx,129
    mov dx,85
    mov si,5
    call drawvl
    ;2nd vertical line 
    mov al,7
    mov cx,134
    mov dx,85
    mov si,5
    call drawvl
    
    ;MOUTH
    mov al,4
    mov cx,115
    mov dx,100
    mov si,10
    call drawhl
    
    ;BODY
    ;vertical line  
    mov al,15
    mov cx,120
    mov dx,110
    mov si,40
    call drawvl
    
   call drawHands
   call drawFeet

   
code ends
end debut