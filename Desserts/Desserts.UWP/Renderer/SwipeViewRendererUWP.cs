using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Input;
using Xamarin.Forms.Platform.UWP;
using Xamarin.Forms;
using Desserts.UWP.Renderer;
[assembly: ExportRenderer(typeof(SwipeView), typeof(SwipeViewRendererUWP))]
namespace Desserts.UWP.Renderer
{
    public class SwipeViewRendererUWP : SwipeViewRenderer
    {
        protected override void OnElementChanged(ElementChangedEventArgs<SwipeView> e)
        {
            base.OnElementChanged(e);

            if (Control != null)
            {
                Control.ManipulationMode = ManipulationModes.TranslateX | ManipulationModes.TranslateInertia;
                Control.ManipulationDelta += Control_ManipulationDelta;
                Control.ManipulationCompleted += Control_ManipulationCompleted;
                Control.ManipulationStarted += Control_ManipulationStarted;
                Control.PointerPressed += Control_PointerPressed;
                Control.PointerReleased += Control_PointerReleased;
            }
        }

        private void Control_ManipulationStarted(object sender, ManipulationStartedRoutedEventArgs e)
        {
        }

        private void Control_PointerReleased(object sender, PointerRoutedEventArgs e)
        {
            ReleasePointerCaptures();
        }

        private void Control_PointerPressed(object sender, PointerRoutedEventArgs e)
        {
            CapturePointer(e.Pointer);
        }

        private bool _isSwiped;

        private void Control_ManipulationCompleted(object sender, ManipulationCompletedRoutedEventArgs e)
        {
            //Server.ConsoleDebug("Swipe Ended");
            _isSwiped = false;
        }

        private void Control_ManipulationDelta(object sender, ManipulationDeltaRoutedEventArgs e)
        {
            if (e.IsInertial && !_isSwiped)
            {
                var swipedDistance = e.Cumulative.Translation.X;

                if (Math.Abs(swipedDistance) <= 2) return;
                {
                    if (swipedDistance > 0)
                    {

                        Element.Open(OpenSwipeItem.LeftItems);
                        //Server.ConsoleDebug("left swipe");
                    }
                    else
                    {
                        Element.Open(OpenSwipeItem.RightItems);
                        //Server.ConsoleDebug("right swipe");
                    }

                    _isSwiped = true;
                }

            }
        }
    }
}
