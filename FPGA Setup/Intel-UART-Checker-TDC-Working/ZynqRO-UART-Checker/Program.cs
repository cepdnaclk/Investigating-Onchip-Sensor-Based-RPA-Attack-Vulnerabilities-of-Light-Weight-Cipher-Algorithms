using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FTD2XX_NET;
using System.IO;

namespace ZynqRO_UART_Checker
{
    class Program
    {
        static int samplingPoints = 1024; //256 for ro attacks
        static int NumROs = 1;

        static UInt32 write(FTDI ftdi, byte[] data, int numChars)
        {
            int i;
            UInt32 numBytesRead = 0;
            FTDI.FT_STATUS ftStatus = FTDI.FT_STATUS.FT_OK;
            //for (i = 0; i < numChars; i++)
            ftdi.Write(data, numChars, ref numBytesRead);

            return numBytesRead;
        }

        static UInt32 read(FTDI ftdi, byte[] data, int numChars)
        {
            UInt32 numBytesRead = 0;
            FTDI.FT_STATUS ftStatus = FTDI.FT_STATUS.FT_OK;
            UInt32 n = (UInt32)numChars;

            ftdi.Read(data, n, ref numBytesRead);

            return numBytesRead;
        }


        static byte convert(byte data)
        {
            byte result = 0;

            if (data == 0)
                result = 0;
            else if (data == 1)
                result = 1;
            else if (data == 3)
                result = 2;
            else if (data == 7)
                result = 3;
            else if (data == 15)
                result = 4;
            else if (data == 31)
                result = 5;
            else if (data == 63)
                result = 6;
            else if (data == 127)
                result = 7;
            else if (data == 255)
                result = 8;
            else if (data == 254)
                result = 9;
            else if (data == 252)
                result = 10;
            else if (data == 248)
                result = 11;
            else if (data == 240)
                result = 12;
            else if (data == 224)
                result = 13;
            else if (data == 192)
                result = 14;
            else if (data == 128)
                result = 15;
            return result;
        }


        static byte MySenconvert(byte data)
        {
            byte result = 0;

            if (data == 0)
                result = 0;
            else if (data == 128)
                result = 1;
            else if (data == 192)
                result = 2;
            else if (data == 224)
                result = 3;
            else if (data == 240)
                result = 4;
            else if (data == 248)
                result = 5;
            else if (data == 252)
                result = 6;
            else if (data == 254)
                result = 7;
            else if (data == 255)
                result = 8;
            else if (data == 127)
                result = 9;
            else if (data == 63)
                result = 10;
            else if (data == 31)
                result = 11;
            else if (data == 15)
                result = 12;
            else if (data == 7)
                result = 13;
            else if (data == 3)
                result = 14;
            else if (data == 1)
                result = 15;
            else if (data == 0)
                result = 16;
            return result;
        }

        static void Main(string[] args)
        {
            UInt32 ftdiDeviceCount = 0;
            UInt32 sampleCount = 0;
            FTDI.FT_STATUS ftStatus = FTDI.FT_STATUS.FT_OK;
            FTDI ftdi = new FTDI();
            string dev = "A5XK3RJT"; //AD0JIHIL //A50285BI AD0JIHILA

            ftStatus = ftdi.GetNumberOfDevices(ref ftdiDeviceCount);

            if (ftStatus == FTDI.FT_STATUS.FT_OK)
            {
                Console.WriteLine("Number of FTDI devices: " + ftdiDeviceCount.ToString());
                Console.WriteLine("");
            }
            else
            {
                // Wait for a key press
                Console.WriteLine("Failed to get number of devices (error " + ftStatus.ToString() + ")");
                Console.ReadKey();
                return;
            }

            DateTime datetime = DateTime.Now;
            String Fname = datetime.Year + "-" + datetime.Month + "-" + datetime.Day + "_" + datetime.Hour + "-" + datetime.Minute + "-" + datetime.Second;
            Console.WriteLine(Fname);
            StreamWriter fin = new StreamWriter("data-in" + Fname + ".txt");
            StreamWriter fout = new StreamWriter("data-out" + Fname + ".txt");
            StreamWriter fkey = new StreamWriter("key" + Fname + ".txt");
            FileStream writeStream = new FileStream("waveTDC" + Fname + ".data", FileMode.Create);
            BinaryWriter waveTDC = new BinaryWriter(writeStream);

            // Allocate storage for device info list
            FTDI.FT_DEVICE_INFO_NODE[] ftdiDeviceList = new FTDI.FT_DEVICE_INFO_NODE[ftdiDeviceCount];
            ftStatus = ftdi.GetDeviceList(ftdiDeviceList);  //AL05SP7N

            // Open first device in our list by serial number
            ftStatus = ftdi.OpenBySerialNumber(dev);
            ftdi.ResetDevice();
            if (ftStatus != FTDI.FT_STATUS.FT_OK)
            {
                // Wait for a key press
                Console.WriteLine("Failed to open device (error " + ftStatus.ToString() + ")");
                Console.ReadKey();
                return;
            }
            else
                Console.WriteLine("FTDI Device with Serial Number : " + dev + " OPENED");

            ftStatus = ftdi.SetBaudRate(400000);
            ftStatus = ftdi.SetDataCharacteristics(FTDI.FT_DATA_BITS.FT_BITS_8, FTDI.FT_STOP_BITS.FT_STOP_BITS_1, FTDI.FT_PARITY.FT_PARITY_NONE);
            ftStatus = ftdi.SetTimeouts(50000, 0);

            byte[,] readArray = new byte[NumROs, samplingPoints];
            int[] readProcessed = new int[samplingPoints];

            byte[] readArray0 = new byte[samplingPoints];
            byte[] readArray1 = new byte[1024];
            byte[] readArray2 = new byte[samplingPoints];
            byte[] readArray3 = new byte[samplingPoints];
            byte[] readArray4 = new byte[samplingPoints];
            byte[] readArray5 = new byte[samplingPoints];
            byte[] readArray6 = new byte[samplingPoints];
            byte[] readArray7 = new byte[samplingPoints];
            byte[] readArrayConfig = new byte[samplingPoints];
            byte[] readArrayCt = new byte[4]; //changed from 16 to 4
            byte[] readArrayCipher = new byte[16]; //changed from 48 to 4*2 + 8 = 16
            UInt32 readbytes = 0;
            byte[] writeData = { 0, 255, 255, 255 };
            if (args.Length != 0)
            {
                int result = Int32.Parse(args[0]);
                writeData[0] = (byte)(result);
            }


            // remove this loop; this is a testing loop

            //while (true)
            //{
            //    //System.Threading.Thread.Sleep(1000);
            //    write(ftdi, writeData, 3);
            //    uint bytesavai = 0;
            //    do
            //    {

            //        ftdi.GetRxBytesAvailable(ref bytesavai);
            //    } while (bytesavai < 48);
            //    //System.Threading.Thread.Sleep(50);
            //    int bytesToRead = (int) bytesavai;
            //    read(ftdi, readArray0, bytesToRead);
            //    for (int i = 0; i < bytesavai; i++)
            //        Console.Write(readArray0[i].ToString("X2") + " ");
            //        //Console.Write(readArray0[i]+ " ");
            //    Console.WriteLine("\n\n");

            //}


            while (true)
            {

                for (int j = 0; j < samplingPoints - 1; j++)
                    readProcessed[j] = 0;

                System.Threading.Thread.Sleep(30);

                write(ftdi, writeData, writeData.Length);
                //read(ftdi, readArrayConfig, 4);

                read(ftdi, readArrayCipher, 16); //changed from 48 to 16
                readbytes = 0;

                for (int i = 0; i < NumROs; i++)
                {
                    readbytes = readbytes + read(ftdi, readArray0, samplingPoints);
                    for (int j = 0; j < samplingPoints - 1; j++)
                    {

                        readProcessed[j] = readArray0[j];
                        //readArray[i, j] = convert(readArray0[j]);
                        // Console.Write(convert(readArray0[j]) + " ");
                        //  Console.Write((readArray0[j]) + " ");
                        //readProcessed[j] = readProcessed[j] + (convert(readArray0[j+1]) - convert(readArray0[j]));
                        //if ((convert(readArray0[j + 1]) - convert(readArray0[j] ))< 0)
                        //    readProcessed[j] = readProcessed[j] + 16;
                    }
                    // Console.Write("\n");
                    Console.Write(".");
                }
                Console.WriteLine("\n" + readbytes + "\n");
                //read(ftdi, readArray1, 1024);
                //Console.WriteLine("read PoSq Data \n");
                for (int i = 0; i < 4; i++)
                    Console.Write(readArrayConfig[i] + " ");

                Console.WriteLine();

                if (readbytes != samplingPoints * NumROs)
                    Console.WriteLine("\nERROR\n\n");
                else
                {
                    // read TDC senosr also
                    // readbytes = readbytes + read(ftdi, readArray1, 1024);
                    sampleCount += 1;
                    for (int i = 0; i < 16; i++) //changed from 48 to 16
                        Console.Write(readArrayCipher[i] + " ");
                    Console.Write("\n");


                    // for (int j = 0; j < NumROs; j++)
                    {
                        Console.WriteLine("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ Trace Number : " + sampleCount);

                        for (int i = 0; i < samplingPoints; i++)
                        {
                            if (sampleCount < 2000)
                            {
                                Console.Write(readProcessed[i] + " ");  //readArray0
                            }
                            //Console.Write(readArray0[i] + " ");
                            waveTDC.Write((float)readProcessed[i]);
                        }
                        waveTDC.Flush();
                        Console.Write("\n");

                        String sin = "";
                        String sout = "";

                        for (int j = 0; j < 4; j++) //changed from 16 to 4 
                        {

                            if (j == 0)
                            {
                                sin = readArrayCipher[j].ToString("X2");
                                sout = readArrayCipher[j + 12].ToString("X2"); //changed from 32 to 12
                            }
                            else
                            {
                                sin = sin + " " + readArrayCipher[j].ToString("X2");
                                sout = sout + " " + readArrayCipher[j + 12].ToString("X2"); //changed from 32 to 12
                            }
                        }

                        fin.WriteLine(sin);
                        fin.Flush();
                        fout.WriteLine(sout);
                        fout.Flush();


                    }
                }

            }




        }
    }
}
