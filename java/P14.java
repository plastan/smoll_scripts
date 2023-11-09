import java.io.*;
public class P14{
	public static void main(String args[]) throws IOException{

		if (args.length != 2){
			System.out.println("usage : copyfile");
			return;
		}
		File filein = new File(args[0]);
		File fileout = new File(args[1]);

		InputStream in = new FileInputStream(filein);
		OutputStream out = new FileOutputStream(fileout);

		byte[] buffer = new byte[1024];
		int length ;

		while ((length = in.read(buffer)) > 0){
			out.write(buffer,0,length);
		}
		in.close();
		out.close();
		System.out.println("file copied successfully");
	}
}
