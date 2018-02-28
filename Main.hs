module Main where
import Control.Monad
import Control.Monad.IO.Class
import Data.IORef
import Graphics.UI.Gtk as GRAPHICS
import Graphics.UI.Gtk.Builder
import System.Exit ( exitFailure )
import System.IO ( hPutStrLn, stderr )
import Data.List ( intersperse )
import Sound.ALUT as SOUND
import System.IO.Unsafe
import Data.IORef


playFile :: FilePath -> IO ()
playFile fileName = do
   buf <- createBuffer (File fileName)
   source <- genObjectName
   buffer source $= Just buf
   SOUND.play [source]
   errs <- SOUND.get alErrors
   unless (null errs) $ do
      hPutStrLn stderr (concat (intersperse "," [ d | ALError _ d <- errs ]))
      exitFailure
   let waitWhilePlaying = do
          sleep 0.1
          state <- SOUND.get (sourceState source)
          when (state == Playing) $
             waitWhilePlaying
   waitWhilePlaying

			
getsound :: Int -> FilePath
getsound 0 = "SOUNDDATA/bao3"
getsound 1 = "SOUNDDATA/dui1"
getsound 2 = "SOUNDDATA/me4"
getsound 3 = "SOUNDDATA/xi4"
getsound 4 = "SOUNDDATA/bao1"
getsound 5 = "SOUNDDATA/wo3"
getsound 6 = "SOUNDDATA/xie1"
getsound 7 = "SOUNDDATA/wo4"
getsound 8 = "SOUNDDATA/dui3"
getsound 9 = "SOUNDDATA/wo2"
getsound 10 = "SOUNDDATA/xi3"
getsound 11 = "SOUNDDATA/xie4"
getsound 12 = "SOUNDDATA/me1"
getsound 13 = "SOUNDDATA/wo1"
getsound 14 = "SOUNDDATA/jiu1"
getsound 15 = "SOUNDDATA/bao2"
getsound 16 = "SOUNDDATA/zhi1"
getsound 17 = "SOUNDDATA/xi2"
getsound 18 = "SOUNDDATA/jiu4"
getsound 19 = "SOUNDDATA/zhi3"
getsound 20 = "SOUNDDATA/xie2"
getsound 21 = "SOUNDDATA/me3"
getsound 22 = "SOUNDDATA/jiu2"
getsound 23 = "SOUNDDATA/xi1"
getsound 24 = "SOUNDDATA/zhi2"
getsound 25 = "SOUNDDATA/bao4"
getsound 26 = "SOUNDDATA/dui2"
getsound 27 = "SOUNDDATA/me2"
getsound 28 = "SOUNDDATA/jiu3"
getsound 29 = "SOUNDDATA/xie3"
getsound 30 = "SOUNDDATA/zhi4"
getsound 31 = "SOUNDDATA/dui4"
	
		
check :: Int -> Int -> Bool
check n c | n == c = True
          | otherwise = False

playsound :: Int -> IO ()
playsound n = do 
              withProgNameAndArgs runALUT $ \progName args -> do (playFile (getsound n))
					 

funcs :: IORef (Int)
funcs = unsafePerformIO $ newIORef 0

crrect :: IORef (Int)
crrect = unsafePerformIO $ newIORef 0

t = True

main :: IO ()
main = do
  initGUI
  builder <- builderNew
  builderAddFromFile builder "GUI2.glade"

  mainWindow <- builderGetObject builder castToWindow "window1"
  onDestroy mainWindow mainQuit

  orderLabel <- builderGetObject builder castToLabel "orderLabel"

  beginbutton <- builderGetObject builder castToButton "beginbutton"
  onClicked beginbutton (do
                        playsound (unsafePerformIO (readIORef funcs))
                        putStr "Global count is:"
                        putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                        putStr "Correct count is:"
                        putStrLn (show (unsafePerformIO (readIORef crrect))) --debug the increment
                        widgetHide beginbutton)
  
  bao3 <- builderGetObject builder castToButton "bao3"
  onClicked bao3 (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 0 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment
				 
  dui1 <- builderGetObject builder castToButton "dui1"
  onClicked dui1 (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 1 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  me4 <- builderGetObject builder castToButton "me4"
  onClicked me4  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 2 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  xi4 <- builderGetObject builder castToButton "xi4"
  onClicked xi4  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 3 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  bao1 <- builderGetObject builder castToButton "bao1"
  onClicked bao1  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 4 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  wo3 <- builderGetObject builder castToButton "wo3"
  onClicked wo3  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 5 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  xie1 <- builderGetObject builder castToButton "xie1"
  onClicked xie1  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 6 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment
  
  wo4 <- builderGetObject builder castToButton "wo4"
  onClicked wo4  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 7 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  dui3 <- builderGetObject builder castToButton "dui3"
  onClicked dui3  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 8 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  wo2 <- builderGetObject builder castToButton "wo2"
  onClicked wo2  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 9 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  xi3 <- builderGetObject builder castToButton "xi3"
  onClicked xi3  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 10 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  xie4 <- builderGetObject builder castToButton "xie4"
  onClicked xie4  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 11 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  me1 <- builderGetObject builder castToButton "me1"
  onClicked me1  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 12 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  wo1 <- builderGetObject builder castToButton "wo1"
  onClicked wo1  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 13 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  jiu1 <- builderGetObject builder castToButton "jiu1"
  onClicked jiu1  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 14 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  bao2 <- builderGetObject builder castToButton "bao2"
  onClicked bao2  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 15 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  zhi1 <- builderGetObject builder castToButton "zhi1"
  onClicked zhi1  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 16 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  xi2 <- builderGetObject builder castToButton "xi2"
  onClicked xi2  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 17 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  jiu4 <- builderGetObject builder castToButton "jiu4"
  onClicked jiu4  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 18 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  zhi3 <- builderGetObject builder castToButton "zhi3"
  onClicked zhi3  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 19 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  xie2 <- builderGetObject builder castToButton "xie2"
  onClicked xie2  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 20 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  me3 <- builderGetObject builder castToButton "me3"
  onClicked me3  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 21 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  jiu2 <- builderGetObject builder castToButton "jiu2"
  onClicked jiu2  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 22 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  xi1 <- builderGetObject builder castToButton "xi1"
  onClicked xi1  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 23 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  zhi2 <- builderGetObject builder castToButton "zhi2"
  onClicked zhi2  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 24 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  bao4 <- builderGetObject builder castToButton "bao4"
  onClicked bao4  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 25 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  dui2 <- builderGetObject builder castToButton "dui2"
  onClicked dui2  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 26 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  me2 <- builderGetObject builder castToButton "me2"
  onClicked me2  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 27 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  jiu3 <- builderGetObject builder castToButton "jiu3"
  onClicked jiu3  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 28 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  xie3 <- builderGetObject builder castToButton "xie3"
  onClicked xie3  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 29 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  zhi4 <- builderGetObject builder castToButton "zhi4"
  onClicked zhi4  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 30 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment

  dui4 <- builderGetObject builder castToButton "dui4" --last so the check method should make sure we handle this properly
  onClicked dui4  (do
                 modifyIORef' funcs (+1) --increment global counter
                 playsound (unsafePerformIO (readIORef funcs))
                 if ((check 31 (unsafePerformIO (readIORef funcs))) == t) 
                    then (modifyIORef' crrect (+1)) 
                    else (putStrLn "Incorrect Answer")
                 putStr "Global count is:"
                 putStrLn (show (unsafePerformIO (readIORef funcs))) --debug the increment
                 putStr "Correct count is:"
                 putStrLn (show (unsafePerformIO (readIORef crrect)))) --debug the increment


                  
  widgetShowAll mainWindow
  mainGUI






