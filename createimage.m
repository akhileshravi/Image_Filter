function I = createimage(f,w1,boundary_options)
%function I = createimage(f,w1,varargin)
%Defaults = {0};
%Defaults(1:nargin-2) = varargin
%boundary_options = cell2mat(Defaults(1))

[fx, fy] = size(f);
[w1x, w1y] = size(w1);
f1 = zeros(fx+w1x, fy+w1y);
f1(1:fx, 1:fy) = f;

try
    flag = 1;
    temp = (class(boundary_options) == 'double');
catch
    flag = 0;
end
if (flag == 1) % if (length of class(boundary_options) -> 6)
    if (class(boundary_options) == 'double') % class(1) -> 'double'
        if boundary_options ~= 0
            b = round(boundary_options);
            b = mod(b,255);
            f1(:, fy+1:end) = b;    % Padding for rightmost columns
            f1(fx+1:end, :) = b;    % Padding for bottommost rows
        end
    end
elseif(size(boundary_options) == size('replicate'))
    if (boundary_options == 'replicate')
        tmp = f(fx,fx);
        f1(fx:end, fy:end) = tmp;   % Right bottom rectangle
                                    % is given right bottom corner value

        f1(fx+1:end, 1:fy) = repmat( f(fx,:), w1x, 1);

        f1(1:fx, fy+1:end) = repmat( f(:,fy), 1, w1y);

    elseif (boundary_options == 'symmetric')
        %New right columns
        for i = 1:w1y
            f1(1:fx,fy+i) = f(:, fy+1-i);
        end

        %New bottom rows and New corner rectangle
        for i = 1:w1x
            f1(fx+i,:) = f1(fx+1-i, :);
        end
    end

elseif(size(boundary_options) == size('circular'))
    if (boundary_options == 'circular')
        %New right columns
        for i = 1:w1y
            f1(1:fx,fy+i) = f(:, i);
        end

        %New bottom rows and New corner rectangle
        for i = 1:w1x
            f1(fx+i,:) = f1(i, :);
        end
    end
end
I = f1;
end