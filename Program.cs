using System;
using OpenCvSharp;

namespace foo
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            var mat = new Mat(100, 100, MatType.CV_8UC1, new Scalar(0));
            Cv2.ImShow("test", mat);
            Cv2.WaitKey();
        }
    }
}
