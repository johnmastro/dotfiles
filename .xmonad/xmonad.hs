-- ~/.xmonad/xmonad.hs
-------------------------------------------------------------------------------

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Actions.GridSelect
import XMonad.Layout.Grid
import XMonad.Layout.Tabbed
import XMonad.Layout.Named
import XMonad.Layout.NoBorders


main = do
    xmproc <- spawnPipe statusBarCmd 
    xmonad $ defaultConfig
        { manageHook         = manageDocks <+> manageHook defaultConfig
        , layoutHook         = myLayouts
        , logHook            = myLogHook xmproc 
        , modMask            = myModMask 
        , borderWidth        = myBorderWidth 
        , terminal           = myTerminal 
        , normalBorderColor  = myNormalBorderColor 
        , focusedBorderColor = myFocusedBorderColor 
        , focusFollowsMouse  = False
        } `additionalKeys` myKeys


-- mod key
myModMask            = mod4Mask

-- terminal
myTerminal           = "urxvt"

-- appearance
myBorderWidth        = 2
myNormalBorderColor  = "#444444"
myFocusedBorderColor = "#88a470"

-- keybindings
dmenuCmd             = "dmenu_run -nb black -nf grey -sb blue -sf grey"
windowShotCmd        = "sleep 0.2; scrot -s -e 'mv $f ~/images/shots/'"
screenShotCmd        = "scrot -e 'mv $f ~/images/shots/'"
lockScreenCmd        = "xscreensaver-command -lock"

myKeys =        
    [ ((mod4Mask, xK_p)                , spawn dmenuCmd)
    , ((mod4Mask, xK_m)                , shellPrompt defaultXPConfig)
    , ((mod4Mask, xK_b)                , sendMessage ToggleStruts)
    , ((mod4Mask, xK_g)                , goToSelected $ gsconfig1 greenColorizer)
    , ((mod4Mask .|. shiftMask, xK_z)  , spawn lockScreenCmd)
    , ((0, xK_Print)                   , spawn screenShotCmd)
    , ((controlMask, xK_Print)         , spawn windowShotCmd) 
    ]

-- xmobar
statusBarCmd     = "/usr/bin/xmobar"

myLogHook h = dynamicLogWithPP $ xmobarPP
    { ppOutput   = hPutStrLn h 
    , ppTitle    = xmobarColor "green" "" . shorten 50
    , ppCurrent  = xmobarColor "yellow" "" . wrap "[" "]" 
    , ppVisible  = wrap "(" ")"
    , ppUrgent   = xmobarColor "red" "yellow"
    }

-- gridselect configuration
gsconfig1 colorizer = (buildDefaultGSConfig colorizer) { gs_cellheight = 30, 
                                                         gs_cellwidth  = 100 } 

greenColorizer   = colorRangeFromClassName
                      black                  -- lowest inactive bg
                      black                  -- highest inactive bg
                      green                  -- active bg
                      white                  -- inactive fg
                      black                  -- active fg
    where 
        black    = minBound
        white    = maxBound
        green    = (0x70,0xFF,0x70)
        blue     = (0x00,0x00,0xFF)


-- layouts
myLayouts        = avoidStruts $ ( tall ||| wide ||| Grid ||| tabbed ||| full )
                                     
    where
        tall     = named "Tall" $ Tall 1 (3/100) (1/2)
        wide     = named "Wide" $ Mirror tall
        tabbed   = named "Tabbed" $ noBorders (simpleTabbed)
        full     = noBorders (Full)
