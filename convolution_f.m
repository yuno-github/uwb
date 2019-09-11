function convolution=convolution_f(convolution,user,num_channels,packet_stream,np,packet,h)

for u=1:user
    for cm=1:100
        for i=1:packet_stream
            for j=1:packet_stream
                if (i-j)>=0 && (i-j)<=(np(cm)-1)
                    convolution(u,cm,i)=convolution(u,cm,i)+packet(u,j)*h(i-j+1,cm);
                end
            end
        end
    end
end