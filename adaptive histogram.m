classdef Assignment2_b_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure           matlab.ui.Figure
        AdaptiveHistogramEqualisationButton  matlab.ui.control.Button
        UploadImageButton  matlab.ui.control.Button
        UIAxes3_2          matlab.ui.control.UIAxes
        UIAxes3            matlab.ui.control.UIAxes
        UIAxes2_2          matlab.ui.control.UIAxes
        UIAxes2            matlab.ui.control.UIAxes
        UIAxes_2           matlab.ui.control.UIAxes
        UIAxes             matlab.ui.control.UIAxes
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: UploadImageButton
        function UploadImageButtonPushed(app, event)
            global a;
            [filename, pathname] = uigetfile('*.*', 'Pick an Image');
            filename=strcat(pathname,filename);
            a=imread(filename);
            imshow(a,'Parent',app.UIAxes);
            histogram(a,'Parent',app.UIAxes_2);
        end

        % Button pushed function: AdaptiveHistogramEqualisationButton
        function AdaptiveHistogramEqualisationButtonPushed(app, event)
            global a;
            b=histeq(a);
            imshow(b,'Parent',app.UIAxes2);
            histogram(b,'Parent',app.UIAxes2_2);

            c=adapthisteq(a);
            imshow(c,'Parent',app.UIAxes3);
            histogram(c,'Parent',app.UIAxes3_2);

        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 835 729];
            app.UIFigure.Name = 'MATLAB App';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Orignal image')
            app.UIAxes.Position = [194 537 244 163];

            % Create UIAxes_2
            app.UIAxes_2 = uiaxes(app.UIFigure);
            title(app.UIAxes_2, 'Histrogram')
            app.UIAxes_2.Position = [518 537 244 163];

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.UIFigure);
            title(app.UIAxes2, 'Historgram Equalisation')
            app.UIAxes2.Position = [49 233 219 158];

            % Create UIAxes2_2
            app.UIAxes2_2 = uiaxes(app.UIFigure);
            title(app.UIAxes2_2, 'Historgram')
            app.UIAxes2_2.Position = [50 29 219 158];

            % Create UIAxes3
            app.UIAxes3 = uiaxes(app.UIFigure);
            title(app.UIAxes3, 'Adaptive Histo, Equal.')
            app.UIAxes3.Position = [471 233 242 158];

            % Create UIAxes3_2
            app.UIAxes3_2 = uiaxes(app.UIFigure);
            title(app.UIAxes3_2, 'Histogram')
            app.UIAxes3_2.Position = [472 29 242 158];

            % Create UploadImageButton
            app.UploadImageButton = uibutton(app.UIFigure, 'push');
            app.UploadImageButton.ButtonPushedFcn = createCallbackFcn(app, @UploadImageButtonPushed, true);
            app.UploadImageButton.Position = [48 595 135 46];
            app.UploadImageButton.Text = 'Upload Image';

            % Create AdaptiveHistogramEqualisationButton
            app.AdaptiveHistogramEqualisationButton = uibutton(app.UIFigure, 'push');
            app.AdaptiveHistogramEqualisationButton.ButtonPushedFcn = createCallbackFcn(app, @AdaptiveHistogramEqualisationButtonPushed, true);
            app.AdaptiveHistogramEqualisationButton.Position = [49 427 199 58];
            app.AdaptiveHistogramEqualisationButton.Text = 'Adaptive Histogram Equalisation';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Assignment2_b_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end